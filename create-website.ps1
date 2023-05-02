$siteName = "iiswebserver"
$sitePhysicalPath = "C:\inetpub\wwwroot\iiswebserver"
$appPoolName = "iiswebserver-app-pool"

# Create a new application pool
New-WebAppPool -Name $appPoolName

# Create the website
New-Website -Name $siteName -PhysicalPath $sitePhysicalPath -ApplicationPool $appPoolName -Port 80 -HostHeader "iiswebserver.com"
