resource "aws_instance" "instance_type" {

  ami           = var.ami_id
  instance_type = var.instance_type

    vpc_security_group_ids = [
        aws_security_group.web_sg.id,
        aws_security_group.ssh_sg.id
    ]

  
}
# Create Security Group for Web Server

resource "aws_security_group" "web_sg" {
  
  description = "Security group for web server"
  tags = {
    prefix_name = "WebServerSG"
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
    
    description = "Security group for SSH access"
    tags = {
      prefix_name = "SshServerSG"
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

