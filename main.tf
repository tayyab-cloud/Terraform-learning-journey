provider "aws" {
  region = "us-east-1"  
  
}



import {
  id = "i-020c0e758256e6a53"
  to = aws_instance.this
}

import {
  id = "i-090513eb0c9d75dce"
  to = aws_instance.server
}


# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_instance" "server" {
  ami                                  = "ami-0fa3fe0fa7920f68e"
  instance_type                        = "t2.micro"
  tags = {
    Name = "2nd server"
  }
  tags_all = {
    Name = "2nd server"
  } 
}

# __generated__ by Terraform
resource "aws_instance" "this" {
  ami                                  = "ami-0ecb62995f68bb549"
  instance_type                        = "t2.micro"
  tags = {
    Name = "1st server"
  }
  
  
}
