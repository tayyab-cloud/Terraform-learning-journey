provider "aws" {
  region = "us-east-1"


}
resource "aws_instance" "instance_type" {

  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "MyFirstInstance"

  }
}
