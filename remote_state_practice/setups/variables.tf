variable "region" {
    type = string
}

variable "ami" {
    type = string
    description = "AMI of webserver"
}

variable "instance_type" {
    type = string
    description = "Instance type"
}

variable "instance_name" {
    type = string
    description = "Instance name"
}