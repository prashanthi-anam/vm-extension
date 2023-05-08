$storageAccountName = "appstore4577687190"
$storageAccountKey = "FzpUacfrkfDo/rpLFdnWNDbtyvJaw70hXs/TRAEESwUzenbb6I+xhMtB4nw103/5ELNIBmXqPVhM+AStNICY7g=="
$containerName = "data"
$blobName = "my_zip_file.zip"
$localDirectory = "D:\sample\my_file.txt"
New-Item -ItemType Directory -Path $localDirectory -Force | Out-Null
$localFilePath = Join-Path -Path $localDirectory -ChildPath $blobName
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name Az.Storage -Repository PSGallery -Force
$context = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey
Get-AzStorageBlobContent -Container $containerName -Blob $blobName -Destination $localFilePath -Context $context
Expand-Archive -LiteralPath $localFilePath -DestinationPath $localDirectory
$remoteDirectory = "C:\inetpub\wwwroot\Default Web Site\my_file.txt"
New-Item -ItemType Directory -Path $remoteDirectory -Force | Out-Null
$remoteFilePath = Join-Path -Path $remoteDirectory -ChildPath "my_file.txt"
Copy-Item -Path (Join-Path -Path $localDirectory -ChildPath "my_file.txt") -Destination $remoteFilePath

