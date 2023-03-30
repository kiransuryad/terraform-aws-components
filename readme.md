# Terraform AWS Database Configuration

This Terraform configuration creates a VPC, subnets, security group, and database instance in AWS. This code is intended to be used as a proof of concept to create a database.

## Variables

The following variables are used to create the VPC:

- `name`: The name of the VPC
- `cidr`: The CIDR block of the VPC
- `azs`: The availability zones in which to create subnets
- `public_subnets`: The CIDR blocks of the subnets
- `enable_dns_hostnames`: Whether to enable DNS hostnames in the VPC
- `enable_dns_support`: Whether to enable DNS support in the VPC

## Resources

The following resources are created by this Terraform configuration:

- `aws_vpc`: Creates a new VPC in AWS with the specified CIDR block and name.
- `aws_subnet`: Creates new subnets in the specified availability zones with the specified CIDR blocks and attaches them to the VPC.
- `aws_security_group`: Creates a new security group in the VPC with inbound and outbound rules for the database instance.
- `aws_db_subnet_group`: Creates a new subnet group for the database instance with the specified subnet IDs.
- `aws_db_instance`: Creates a new database instance with the specified parameters.
