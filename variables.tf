variable "instance_type" {
    description = "EC2 instance type"
    type        = map(string)
    default = {
        "dev"  = "t2.micro"
        "prod" = "t2.micro"    
        "stage" = "t2.micro"
    
  
}
}

variable "ami_ubuntu" {
    description = "AMI ID for the EC2 instance"
    type        = string
   
  
}
 

# variable "root_vpc_cidr" {
#     description = "The CIDR block for the VPC"
#     type        = string
  
# }
# variable "root_subnet_cidr" {
#     description = "The CIDR block for the subnet"
#     type        = string
  
# }


