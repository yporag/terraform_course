terraform {
    backend "s3" {
        bucket_name = "bucket_name"
        key         = "prod/terraform.tfstate"
        region      = var.region
    }
}

provider "aws" {
    region  = var.region
}

resource "aws_instance" "webserver" {
    ami             = var.ami
    instance_type   = var.instance_type

    tags = {
        Name = var.instance_name
    }
}