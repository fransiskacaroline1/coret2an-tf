// Create Internet Gateway
resource "aws_internet_gateway" "gateway_main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.name}-igw"
  }
}

// Create Elastic IP
resource "aws_eip" "eip" {
  vpc = true
}

// Create NAT Gateway 
resource "aws_nat_gateway" "nat" {
  // for allocationing elastic IP
  allocation_id = aws_eip.eip.id
  // for attaching subnet
  subnet_id = aws_subnet.public.id

  tags = {
    Name = "${local.name}-nat"
  }
}