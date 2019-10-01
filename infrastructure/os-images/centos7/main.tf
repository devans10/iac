

# kickstart file 
resource "local_file" "kickstart" {
    content = templatefile("${var.kickstart_template}", { rootpw = "${var.ssh_password}" })
    filename = "http/${var.kickstart_filename}"
}

module "images" {
    source = "../../../provisioning/terraform/packer-image"
    json_file = "${var.json_filename}"
    iso_url = "${var.iso_url}"
    iso_checksum = "${var.iso_checksum}"
    iso_checksum_type = "${var.iso_checksum_type}"
    ssh_username = "${var.ssh_username}"
    ssh_password = "${var.ssh_password}"
}