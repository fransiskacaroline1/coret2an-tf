resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet[0]
  availability_zone = var.az[0]
  tags = {
    Name = "${local.name}-public-subnet"
  }
}


resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet[2]
  availability_zone = var.az[1]
  tags = {
    Name = "${local.name}-public-subnet-2"
  }
}


resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet[1]
  availability_zone = var.az[0]
  tags = {
    Name = "${local.name}-private-subnet"
  }
}

resource "aws_subnet" "private-rds" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet[3]
  availability_zone = var.az[0]
  tags = {
    Name = "${local.name}-rds-subnet"
  }
}

resource "aws_subnet" "private-rds-2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet[4]
  availability_zone = var.az[1]
  tags = {
    Name = "${local.name}-rds-subnet-2"
  }
}
