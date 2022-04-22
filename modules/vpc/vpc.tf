resource "aws_vpc" "lab_vpc" {
    cidr_block = var.cidr_vpc
    enable_dns_support = true
    enable_dns_hostnames = true
    assign_generated_ipv6_cidr_block = true
    tags = { Name = "lab_vpc" }
}


resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.lab_vpc.id
    tags = { Name = "myigw" }
}

resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.lab-public-sn.id
  depends_on    = [aws_internet_gateway.igw]
  tags = {
    Name        = "nat"
  }
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.lab_vpc.id
    route {
        cidr_block = var.cidr_default
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = { Name = "public_rt" }
}

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.lab_vpc.id
    route {
        cidr_block = var.cidr_default
        gateway_id = aws_nat_gateway.nat.id
    }
    tags = { Name = "private_rt" }
}

resource "aws_subnet" "lab-public-sn" {
    vpc_id = aws_vpc.lab_vpc.id
    cidr_block = var.cidr_sn_public
    availability_zone = var.az
    map_public_ip_on_launch = true
    tags = { Name = "lab-public-sn" }
}

resource "aws_subnet" "lab-private-sn" {
    vpc_id = aws_vpc.lab_vpc.id
    cidr_block = var.cidr_sn_private
    availability_zone = var.az
    map_public_ip_on_launch = true
    tags = { Name = "lab-private-sn" }
}

resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.lab-public-sn.id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.lab-private-sn.id
    route_table_id = aws_route_table.private_rt.id
}