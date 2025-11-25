variable "instance_type" {
    description = "EC2 instance type"
    type        = string
    default     = "t2.micro"
  
}

variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    type        = string
  
}
variable "enviroment" {
    description = "Deployment environment"
    type        = string
  
}   
variable "web_sg" {
    description = "Security group for web server"
    type        = string
  
}
variable "ssh_sg" {
    description = "Security group for SSH access"
    type        = string    
}
