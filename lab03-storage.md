# LAB 03: Azure Storage

## Authenticate to Azure and select the subscription (if you have more than one)

> [!TIP]
> To retrieve the name of your subscription run the following command:

```powershell
Get-AzSubscription | Out-GridView

$SubscriptionName = "<Subscription Name>"
```

## Set up the variables

- Provide the name of your resource group: `$ResourceGroupName`

- Provide the name of your new storage account: `$StorageAccountName`

- Provide a name for your new container: `$ContainerName`

- Provide a name for your new blob: `$BlobName`

- Provide the full path to a file you want to upload: `$FileToUpload`

- Provide the full path to a directory you wish to use for downloaded blobs: `$DestinationFolder`

### Create a new storage account

### Get a context of the storage account

> [!TIP]
> Context is the property of the storage account object

### Create a new container

> [!TIP]
> The following command will give you a list of the needed cmdlets

```powershell
Get-Command -Module Az.Storage -noun *container*, *blob* | sort noun | ft -GroupBy noun
```

### Upload a blob to the container

### List all blobs in the container

### Create a destination folder on your machine (if it doesn't exist)

### Download the blob to the local destination folder

### Delete the container
