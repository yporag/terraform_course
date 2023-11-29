
# The terraform {} block contains Terraform settings, including the required providers
terraform { 
  required_providers {
    aws = {
      # the source attribute defines an optional hostname, a namespace, and the provider type
      source  = "hashicorp/aws" 
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

# The provider block configures the specified provider.
# A provider is a plugin that Terraform uses to create and manage your resources.
# You can use multiple provider blocks in your Terraform configuration to manage resources from different providers
provider "aws" {
  region  = "us-west-2"
}

# Use resource blocks to define components of your infrastructure. 
# A resource might be a physical or virtual component such as an EC2 instance, or it can be a logical resource such as a Heroku application
resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
