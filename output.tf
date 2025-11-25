output "ec2_public_ip" {
    description = "The public IP address of the EC2 instance"
    value = module.ec2.ec2_public_ip
  
}
output "dbserver_public_ip" {
    description = "The public IP address of the DB server EC2 instance."
    value = module.ec2.dbserver_public_ip
  
}
output "web_sg" {
    description = "The ID of the web security group"
    value = module.ec2.web_sg
  
}
output "ssh_sg" {
    description = "The ID of the SSH security group"
    value = module.ec2.ssh_sg
  
}