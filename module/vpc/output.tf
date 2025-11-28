output "subnet_id" {
    description = "The ID of the created subnet"
    value       = aws_subnet.my_subnet.id
  
}

output "my_sg" {
    description = "The ID of the security group"
    value       = aws_security_group.my_sg.id
  
}