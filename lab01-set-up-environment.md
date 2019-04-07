# How to set up your environment

## Install Azure PowerShell from PowerShell Gallery

### System requirements

Azure PowerShell works with PowerShell 5.1 or higher on Windows, or PowerShell 6 on any platform.
If you are using PowerShell 5 on Windows, you also need .NET Framework 4.7.2 installed.

```powershell
# Install the Az module from the PowerShell Gallery
Install-Module -Name Az -AllowClobber -Scope CurrentUser
```

## Install Visual Studio Code and its extensions

If you're on Windows 7 or greater with the PowerShellGet module installed, you can easily install both Visual Studio Code and the PowerShell extension by running the following command:

```powershell
Install-Script Install-VSCode -Scope CurrentUser; Install-VSCode.ps1
```

[Installation script on GitHub](https://github.com/PowerShell/vscode-powershell/blob/develop/scripts/Install-VSCode.ps1)

[Installation script on the PowerShell Gallery](https://www.powershellgallery.com/packages/Install-VSCode/)

Manually install [Visual Studio Code](https://code.visualstudio.com/)

## Visual Studio Code extensions

Search Extensions (Ctrl+Shift+X)

[PowerShell](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)

[Azure CLI Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli)

[Azure Account](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account) (On Windows, it requires [Node.js 6 or later](https://nodejs.org/en/) for Cloud Shell)

[Azure Resource Manager Tools](https://marketplace.visualstudio.com/items?itemName=msazurermtools.azurerm-vscode-tools)

[Azure Storage](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurestorage)

## Azure Cloud Shell

Configure [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview)