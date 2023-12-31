provider "aws" {
    region = us-west-2
}

provider "aws" {
    alias = "east"
    region = us-east-1
}

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
}

module "module_practice_import" {
    source          = "../modules/webserver"
    vpc_id          = aws_vpc.main.id
    ami             = "ami-003634241a8fcdec0"
    cidr_block      = aws_vpc.main.cidr_block
    webserver_name  = "test webserver"
    instance_type   =  "t2.micro" 
}

output "module_instance_id" {
    value = module.module_practice_import.instance_output.id
}

# resource "aws_elb" "main" {
#     instances = module.module_practice_import.instance_output.id
#     #additional required components
# }


#by default, moudles inherit the provider of the calling file
module "module_practice_import_east" {
    source          = "../modules/webserver"
    providers       = { aws = aws.east }
    #the following variables should be changesd to acomidate new provider
    vpc_id          = aws_vpc.main.id
    ami             = "ami-003634241a8fcdec0"
    cidr_block      = aws_vpc.main.cidr_block
    webserver_name  = "test webserver"
    instance_type   =  "t2.micro" 
}


# This part is imported from module

# resource "aws_subnet" "webserver" {
#     vpc_id = aws_vpc.main.id
#     cidr_block = aws_vpc.main.cidr_block
# }


# resource "aws_instance" "webserver" {
#     ami             = "ami-003634241a8fcdec0"
#     instance_type   = "t2.micro" 
#     subnet_id       = aws_subnet.webserver.id

#     tags = {
#         Name = "test webserver"
#     }
# }