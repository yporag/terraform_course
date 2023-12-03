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
