output "ec2_public_ip" {
    description = "The public IP address of the EC2 instance."
    value       = aws_instance.instance_type.public_ip
  
}
output "dbserver_public_ip" {
    description = "The public IP address of the DB server EC2 instance."
    value       = aws_instance.instance_type.public_ip

  
}

output "web_sg" {
    description = "The ID of the web server security group."
    value       = aws_security_group.web_sg.id
  
}
output "ssh_sg" {
    description = "The ID of the SSH access security group."
    value       = aws_security_group.ssh_sg.id
  
}
