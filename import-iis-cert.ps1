$certFilePath = "D:\temp\cer\mycert.pfx"
$password = ConvertTo-SecureString -String "admin@123" -Force -AsPlainText
$certificate = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($certFilePath, $password)
$certStore = New-Object System.Security.Cryptography.X509Certificates.X509Store("My", "LocalMachine")
$certStore.Open("ReadWrite")
$certStore.Add($certificate)
$certStore.Close()
Import-Certificate -FilePath "D:\temp\cer\mycert.pfx" -CertStoreLocation "Cert:\LocalMachine\My"
New-WebBinding -Name "Default Web Site" -IPAddress "*" -Port 443 -Protocol "https" -SslFlags 1 -CertificateThumbPrint "640E366F99027C55706059FABF235B2F7CCFAD56"

