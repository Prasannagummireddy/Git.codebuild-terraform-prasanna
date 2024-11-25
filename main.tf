provider "aws" {
  region = "eu-central-1"

}

terraform {
  backend "s3" {
    bucket = "prasanna-git-codebuild"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}



module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  version         = "5.16.0"
  name            = "Prasanna-VPC"
  cidr            = "10.0.0.0/16"
  azs             = ["eu-central-1"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]
  public_subnet_tags = {
    Name = "Prasanna-public-Subnet"
  }
  private_subnet_tags = {
    Name = "Prasanna-Private-Subnet"
  }
  tags = {
    Owner = "Prasanna"
  }
}

