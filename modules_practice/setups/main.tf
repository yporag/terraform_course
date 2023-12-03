provider "aws" {
    region = us-west-2
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