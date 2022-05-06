terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

#Configure aws provider
provider "aws" {
  region = "us-west-2"
  profile = "manaya-cli"
}

#Create VPC
resource "aws_vpc" "manaya-terraform-hw1" {
  cidr_block = "172.199.0.0/16"

  tags = {
    Name = "manaya-Terraform-VPC"
  }
}

#Create Internet Gateway
resource "aws_internet_gateway" "manaya-terraform-igw" {
  vpc_id = aws_vpc.manaya-terraform-hw1.id

  tags = {
    Name = "manaya Terraform IGW"
  }
}

#Create Public Subnets
resource "aws_subnet" "manaya-terraform-PubSub1" {
  vpc_id = aws_vpc.manaya-terraform-hw1.id
  cidr_block = "172.199.11.0/24"

  tags = {
    Name = "manaya Terraform Public Subnet 1"
  }
}
resource "aws_subnet" "manaya-terraform-PubSub2" {
  vpc_id = aws_vpc.manaya-terraform-hw1.id
  cidr_block = "172.199.12.0/24"

  tags = {
    Name = "manaya Terraform Public Subnet 2"
  }
}
resource "aws_subnet" "manaya-terraform-PubSub3" {
  vpc_id = aws_vpc.manaya-terraform-hw1.id
  cidr_block = "172.199.13.0/24"

  tags = {
    Name = "manaya Terraform Public Subnet 3"
  }
}

#Create Private Subnets
resource "aws_subnet" "manaya-terraform-PrivSub1" {
  vpc_id = aws_vpc.manaya-terraform-hw1.id
  cidr_block = "172.199.21.0/24"

  tags = {
    Name = "manaya Terraform Private Subnet 1"
  }
}
resource "aws_subnet" "manaya-terraform-PrivSub2" {
  vpc_id = aws_vpc.manaya-terraform-hw1.id
  cidr_block = "172.199.22.0/24"

  tags = {
    Name = "manaya Terraform Private Subnet 2"
  }
}
resource "aws_subnet" "manaya-terraform-PrivSub3" {
  vpc_id = aws_vpc.manaya-terraform-hw1.id
  cidr_block = "172.199.23.0/24"

  tags = {
    Name = "manaya Terraform Private Subnet 3"
  }
}

#Create Public Route Table
resource "aws_route_table" "manaya-terraform-PubRT" {
  vpc_id = aws_vpc.manaya-terraform-hw1.id

  tags =  {
    Name = "manaya Terraform Public Route Table"
  }
}

#Create NAT Gateway
resource "aws_nat_gateway" "manaya-terraform-natgw" {
  connectivity_type = "private"
  subnet_id = aws_subnet.manaya-terraform-PrivSub1.id

  tags = {
    Name = "manaya Terraform NAT GW"
  }
}

#Create Private Route Table
resource "aws_route_table" "manaya-terraform-PrivRT" {
  vpc_id = aws_vpc.manaya-terraform-hw1.id

  tags =  {
    Name = "manaya Terraform Private Route Table"
  }
}
