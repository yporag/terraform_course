provider "aws" {
    region  = var.region
}

locals {
  instance_name = "${terraform.workspace}-instance"
}

resource "aws_instance" "webserver" {
    ami             = var.ami
    instance_type   = vat.instance_type

    tags = {
        Name = local.instance_name
    }
}