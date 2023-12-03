variable "vpc_id" {
    type = string
    description = "VPC id"
}

variable "cidr_block" {
    type = string
    description = "Subnet cider block"
}

variable "webserver_name" {
    type = string
    description = "Name of webserver"
}

variable "ami" {
    type = string
    description = "AMI of webserver"
    
}

variable "instance_type" {
    type = string
    description = "Instance type"
}
