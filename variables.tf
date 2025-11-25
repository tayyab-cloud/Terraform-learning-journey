variable "instance_type" {
    description = "EC2 instance type"
    type        = string
    default     = "t2.micro"
  
}

variable "ami_ubuntu" {
    description = "AMI ID for the EC2 instance"
    type        = string
   
  
}
 
 variable "ami_linux" {
    description = "AMI ID for the Linux EC2 instance"
    type        = string
   
 }



