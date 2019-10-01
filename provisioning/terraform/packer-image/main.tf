##### packer-image/main.tf #####

resource "null_resource" "packer" {
    provisioner "local-exec" {
        command = <<EOF
packer build -var ssh_username=${var.ssh_username} \
             -var ssh_password=${var.ssh_password} \
             -var iso_url=${var.iso_url} \
             -var iso_checksum=${var.iso_checksum} \
             -var iso_checksum_type=${var.iso_checksum_type} \
             ${var.json_file}
EOF
        environment = {
            PACKER_LOG = 1
        }
    }
}

