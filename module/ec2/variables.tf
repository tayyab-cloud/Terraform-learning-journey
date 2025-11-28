variable "instance_type" {
    description = "EC2 instance type"
    type        = string
    default     = "t2.micro"
  
}

variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    type        = string
  
}

variable "subnet_id" {
    description = "The ID of the subnet where EC2 will be launched"
    type        = string
  
}

variable "sg_id" {

    type = string
  
}

