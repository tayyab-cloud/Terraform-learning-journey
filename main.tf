provider "aws" {
    region = "us-east-1"
    
  
}
resource "aws_instance" "this" {
    ami = "ami-0fa3fe0fa7920f68e"
    instance_type = "t2.micro"
    tags = {
        Name = "MyFirstInstance"
    }
  
}
