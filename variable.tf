
locals {
  iis_cert_import_script = replace(data.template_file.iis_cert_import_script.rendered, "\r\n", "\n")
}



locals {
  iis_cert_import_script_encoded = base64encode(local.iis_cert_import_script)
}
data "template_file" "iis_cert_import_script" {
  template = file("${path.module}/import-iis-cert.ps1")
}

output "virtual_machine_id" {
  value = azurerm_windows_virtual_machine.app_vm.id  
}

output "iis_cert_import_script" {
  value = local.iis_cert_import_script
}

output "iis_cert_import_script_encoded" {
  value = local.iis_cert_import_script_encoded
}