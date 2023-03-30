# This code creates a VPC, subnets, security group, and database instance in AWS.
# This code is used to create a database for a proof of concept.

# The following variables are used to create the VPC:
#   name: The name of the VPC
#   cidr: The CIDR block of the VPC
#   azs: The availability zones in which to create subnets
#   public_subnets: The CIDR blocks of the subnets
#   enable_dns_hostnames: Whether to enable DNS hostnames in the VPC
#   enable_dns_support: Whether to enable DNS support in the VPC

# The following resource is used to create a database subnet group:
#   name: The name of the database subnet group
#   subnet_ids: The subnet IDs of the database subnets

# The following resource is used to create a security group:
#   name: The name of the security group
#   vpc_id: The ID of the VPC

# The following resource is used to create a database parameter group:
#   name: The name of the database parameter group
#   family: The family of the database parameter group

# The following resource is used to create a database instance:
#   identifier: The identifier of the database instance
#   instance_class: The instance class of the database instance
#   allocated_storage: The allocated storage of the database instance
#   engine: The database engine to use
#   engine_version: The database engine version to use
#   username: The master username for the database instance
#   password: The master password for the database instance
#   db_subnet_group_name: The name of the database subnet group
#   vpc_security_group_ids: The IDs of the security groups to associate with the database instance
#   parameter_group_name: The name of the database parameter group
#   publicly_accessible: Whether the database instance is publicly accessible
#   skip_final_snapshot: Whether to skip the creation of a final snapshot before the database instance is deleted

# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region = var.region
}

# This code creates/updates an S3 bucket to store the Terraform state file
# for the module.

terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = "my-terraform-state-bucket-00987"
    key            = "rds/terraform.tfstate" # Change this key to a unique value per module
    region         = "us-east-1"
    dynamodb_table = "my-terraform-state-lock-table"
    encrypt        = true
  }
}


#data "aws_availability_zones" "available" {}
variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.77.0"

  name                 = "talbot-devops-poc"
  cidr                 = "10.0.0.0/16"
  azs                  = var.availability_zones
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_db_subnet_group" "talbot_devops_poc" {
  name       = "talbot-devops-poc"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = "talbot-devops-poc"
  }
}

resource "aws_security_group" "rds" {
  name   = "talbot-devops-poc_rds"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "talbot-devops-poc_rds"
  }
}

resource "aws_db_parameter_group" "talbot_devops_poc" {
  name   = "talbot-devops-poc"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "talbot_devops_poc" {
  identifier             = "talbot-devops-poc"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "14.1"
  username               = "talbot_user"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.talbot_devops_poc.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.talbot_devops_poc.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}
