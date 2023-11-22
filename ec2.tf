resource "aws_ebs_encryption_by_default" "summarecon" {
  enabled = true
}

#Creating EC2 OpenVPNServer for Public Subnet
resource "aws_security_group" "openvpn_server" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2 instance
resource "aws_instance" "openvpn_server" {
  ami           = "ami-05caa5aa0186b660f"  # Replace with the desired Linux AMI ID
  instance_type = "t3.micro"
  key_name      = "fransiska.pem"      # Replace with the EC2 key pair name
  subnet_id     = aws_subnet.public_subnet_1.id

  root_block_device {
    volume_size = 30
    encrypted   = true
  }

  tags = {
    Name = "OpenVPNServer"
  }

  vpc_security_group_ids = [aws_security_group.openvpn_server.id]
}

output "instance_public_ip" {
  value = aws_instance.openvpn_server.public_ip
}

# Create security group for DevServer
resource "aws_security_group" "dev_server" {
  vpc_id = aws_vpc.my_vpc.id

  # Allow inbound SSH traffic on port 22
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with more restrictive IP range if needed
  }
}

# Create EC2 DevServer instance in the private subnet
resource "aws_instance" "dev_server" {
  ami           = "ami-05caa5aa0186b660f"  # Replace with the desired Linux AMI ID
  instance_type = "c5.large"
  key_name      = "fransiska.pem"      # Replace with EC2 key pair name
  subnet_id     = aws_subnet.prodsubnet.id
  root_block_device {
    volume_size = 50
    encrypted   = true
  }

  tags = {
    Name = "DevServer"
  }

  vpc_security_group_ids = [aws_security_group.dev_server.id]
}

output "instancedev_private_ip" {
  value = aws_instance.dev_server.private_ip
}

# Create security group for BackendServer
resource "aws_security_group" "backend_server" {
  vpc_id = aws_vpc.my_vpc.id

  # Allow inbound SSH traffic on port 22
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with more restrictive IP range if needed
  }

  # Add additional rules as needed for your application
}

# Create EC2 BackendServer instance in the private subnet
resource "aws_instance" "backend_server" {
  ami           = "ami-05caa5aa0186b660f"  # Replace with the desired Linux AMI ID
  instance_type = "c5.xlarge"
  key_name      = "fransiska.pem"      # Replace with the EC2 key pair name
  subnet_id     = aws_subnet.prodsubnet.id
  root_block_device {
    volume_size = 50
    encrypted   = true
  }

  tags = {
    Name = "BackendServer"
  }

  vpc_security_group_ids = [aws_security_group.backend_server.id]
}

output "instancebackend_private_ip" {
  value = aws_instance.backend_server.private_ip
}
