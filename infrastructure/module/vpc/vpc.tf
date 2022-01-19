
# create the VPC 

resource "aws_vpc" "VPC" {
  cidr_block           = var.vpc.vpcCIDR
  instance_tenancy     = var.instanceTenancy 
  enable_dns_support   = var.dnsSupport 
  enable_dns_hostnames = var.dnsHostNames

tags = {
    Name = var.vpc.VPCname
}
} 


# create the Subnet

resource "aws_subnet" "subnetPublic" {
  count = length(var.vpc.public_subnetCIDR)  
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.vpc.public_subnetCIDR[count.index]
  map_public_ip_on_launch = "true"
  availability_zone       = var.vpc.public_subnet_az[count.index]
tags = {
   Name = var.vpc.public_subnetName[count.index]
}
}

resource "aws_subnet" "subnetPrivate" {
  count = length(var.vpc.private_subnetCIDR)  
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.vpc.private_subnetCIDR[count.index]
  map_public_ip_on_launch = "false"
  availability_zone       = var.vpc.private_subnet_az[count.index]
tags = {
   Name = var.vpc.private_subnetName[count.index]
}
}


# create the Internet Gateway

resource "aws_internet_gateway" "igw" {
    count = length(var.vpc.igwName) > 0 ? 1 : 0 
    vpc_id = aws_vpc.VPC.id
    tags = {
        Name = var.vpc.igwName
    }
}


# create the Public Route Table

resource "aws_route_table" "rtPublic" {
  count = length(var.vpc.public_route_table_name) > 0 ? 1 : 0
  vpc_id = aws_vpc.VPC.id
    tags = {
    Name = var.vpc.public_route_table_name[count.index]
  }
  
}

# create the Private Route Table

resource "aws_route_table" "rtPrivate" {
  count = length(var.vpc.private_route_table_name) > 0 ? 1 : 0
  vpc_id = aws_vpc.VPC.id
    tags = {
    Name = var.vpc.private_route_table_name[count.index]
  }
  
}
