variable "cidr" {
  default = "172.18.0.0/22"
}

locals {
  name = "summarecon"
}

# Variable for CIDR Subnet public, private, staging
variable "subnet" {
  type    = list(any)
  default = ["172.18.1.0/26", "172.18.2.0/26", "172.18.3.0/26", "172.18.3.64/26", "172.18.3.128/26"]
}

# Variable for Availability Zone
variable "az" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b"]
}

variable "region" {
  default = "us-east-1"
}
variable "c52x" {
  default = "c5.2xlarge"
}

variable "t3" {
  default = "t3.micro"
}

variable "c5" {
  default = "c5.large"
}

variable "c5x" {
  default = "c5.xlarge"
}

variable "key" {
  default = "summarecon"
}

variable "class" {
  default = "db.r5.large"
}
variable "ubuntu" {
  default = "ami-0fc5d935ebf8bc3bc"
}

