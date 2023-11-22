output "security_groups" {
  value = aws_security_group.summarecon.id
}

output "public_ip" {
  value = aws_instance.openvpn.public_ip
}