// create vpc
resource "aws_vpc" "main" {
  cidr_block = var.cidr
  tags = {
    Name = "${local.name}-vpc"
  }
}