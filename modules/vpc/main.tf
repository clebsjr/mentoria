resource "aws_vpc" "vpc_main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-${var.environment}"
  }
}

resource "aws_subnet" "subnet_main" {
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet-main-${var.environment}"
  }
}

resource "aws_subnet" "subnet_secondary" {
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet-secondary-${var.environment}"
  }
}

resource "aws_internet_gateway" "igw" {
  tags = {
    Name = "igw-${var.environment}"
  }
}

resource "aws_internet_gateway_attachment" "igw_attachment" { // anexa o IGW ao VPC, porem quando a vpc é indicada na criacao do IGW ele ja anexa automaticamente
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.vpc_main.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc_main.id

  tags = {
    Name = "rt-${var.environment}"
  }
}

resource "aws_route" "r" {
  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet_main.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rta_secondary" {
  subnet_id      = aws_subnet.subnet_secondary.id
  route_table_id = aws_route_table.rt.id
}
