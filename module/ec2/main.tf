


# Create EC2 Instance

resource "aws_instance" "instance_type" {

  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "my${terraform.workspace}-server"
  }
  
}