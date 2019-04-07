# TUTORIAL: Create virtual machines with the Azure PowerShell
# https://docs.microsoft.com/en-us/powershell/azure/azureps-vm-tutorial

#region Log in

# If you're using a local install of the Azure PowerShell,
# you need to log in before performing any other steps.

Connect-AzAccount

#endregion

#region Create a resource group

# In Azure, all resources are allocated in a resource management group. 
# Resource groups provide logical groupings of resources that make them easier to work with as a collection. 
# For this tutorial, all of the created resources go into a single group named TutorialResources.

New-AzResourceGroup -Name TutorialResources -Location westeurope

#endregion

#region Create admin credentials for the VM

# Before you can create a new virtual machine, you must create a credential object containing the username
# and password for the administrator account of the Windows VM.

$cred = Get-Credential -Message "Enter a username and password for the virtual machine."

#endregion

#region Create a virtual machine

# Virtual machines in Azure have a large number of dependencies.
# The Azure PowerShell creates these resources for you based on the command-line arguments you specify.
# For readability, we are using PowerShell splatting to pass parameters to the Azure PowerShell cmdlets.

# Create a new virtual machine running Windows.

$vmParams = @{
    ResourceGroupName = 'TutorialResources'
    Name = 'TutorialVM1'
    Location = 'westeurope'
    ImageName = 'Win2016Datacenter'
    PublicIpAddressName = 'tutorialPublicIp'
    Credential = $cred
    OpenPorts = 3389
  }

  $newVM1 = New-AzVM @vmParams

  # Once the VM is ready, we can view the results in the Azure Portal or by inspecting the $newVM1 variable.

  $newVM1

  # Property values listed inside of braces are nested objects.
  # In the next step we will show you how to view specific values in these nested objects.

#endregion

#region Get VM information with queries

# Let's get some more detailed information from the VM we just created.

$newVM1.OSProfile | Select-Object ComputerName,AdminUserName

$newVM1 | Get-AzNetworkInterface |
  Select-Object -ExpandProperty IpConfigurations |
    Select-Object Name, PrivateIpAddress

# To confirm that the VM is running, we need to connect via Remote Desktop.
# For that, we need to know the Public IP address.

$publicIp = Get-AzPublicIpAddress -Name tutorialPublicIp -ResourceGroupName TutorialResources

$publicIp | Select-Object Name,IpAddress,@{label='FQDN';expression={$_.DnsSettings.Fqdn}}

# From your local machine you can run the following command to connect to the VM over Remote Desktop.

# mstsc.exe /v <PUBLIC_IP_ADDRESS>

#endregion

#region Creating a new VM on the existing subnet

# The second VM uses the existing subnet.

$vm2Params = @{
    ResourceGroupName = 'TutorialResources'
    Name = 'TutorialVM2'
    ImageName = 'Win2016Datacenter'
    VirtualNetworkName = 'TutorialVM1'
    SubnetName = 'TutorialVM1'
    PublicIpAddressName = 'tutorialPublicIp2'
    Credential = $cred
    OpenPorts = 3389
  }
  $newVM2 = New-AzVM @vm2Params
  
  $newVM2

  # Use the following command to connect using Remote Desktop.

  mstsc.exe /v $newVM2.FullyQualifiedDomainName

#endregion

#region Cleanup

# Now that the tutorial is complete, it's time to clean up the created resources.
# You can delete individual resources with the Remove-AzResource command,
# but the safest way to remove all resources in a resource group is delete the group
# using the Remove-AzResourceGroup command.

$job = Remove-AzResourceGroup -Name TutorialResources -Force -AsJob

$job

# The -AsJob parameter keeps PowerShell from blocking while the deletion takes place.
# To wait until the deletion is complete, use the following command:

Wait-Job -Id $job.Id

# With cleanup completed, the tutorial is finished.

#region
