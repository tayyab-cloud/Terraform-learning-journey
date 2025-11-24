provider "aws" {
  region = "us-east-1"


}
resource "aws_instance" "instance_type" {

  ami           = var.ami_id
  instance_type = var.instance_type

    vpc_security_group_ids = [
        aws_security_group.web_sg.id,
        aws_security_group.ssh_sg.id
    ]
  tags = {
    Name = var.enviroment == "prod" ? "ProdServer" : "DevServer"

  }
}
# Create Security Group for Web Server

resource "aws_security_group" "web_sg" {
  name = var.web_sg
  description = "Security group for web server"
  tags = {
    Name = "WebServerSG"
  }
  # Inbound rule to allow HTTP traffic

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule to allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
 # Create Security Group for SSH Access

resource "aws_security_group" "ssh_sg" {
    name = var.ssh_sg
    description = "Security group for SSH access"
    tags = {
      Name = "SshServerSG"
    }
    # Inbound rule to allow SSH traffic
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    # Outbound rule to allow all traffic
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

  
}
}

