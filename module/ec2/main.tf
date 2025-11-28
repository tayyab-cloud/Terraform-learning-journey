
# Create Key Pair 
resource "aws_key_pair" "deploy_key" {
  key_name = "terraform-deploy-key"
  public_key = file("${path.root}/mykey.pub")
  
}
# Create EC2 Instance

resource "aws_instance" "instance_type" {

  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name = aws_key_pair.deploy_key.key_name


 # Connection block
 connection {
    type        = "ssh" 
    user        = "ubuntu"
    private_key = file("${path.root}/mykey")
    host        = self.public_ip
}
# Provisioner file
  provisioner "file" {
      source      = "${path.root}/app.py"
      destination = "/home/ubuntu/app.py"

  }
  # Provisioner remote-exec
provisioner "remote-exec" {
    inline = [
      "echo 'Remote Exec starting...'",
      
      # 1. Update and Install Flask via APT (Ubuntu 24.04 requirement)
      "sudo apt update -y",
      "sudo apt install -y python3-flask",
      
      # 2. Kill any existing python process to avoid conflicts
      "sudo killall python3 || true",
      
      # 3. THE MAGIC LINE (Run in background without hanging up)
        # > app.log 2>&1: Save all logs to file + No Hang Up)
        # nohup: Don't terminate process when session ends)
        # &: Run in background
      "sudo nohup flask --app app run --host=0.0.0.0 --port=80 > app.log 2>&1 &",
      
      # 4. Sleep for 2 seconds to let the process start before Terraform disconnects
      "sleep 2"
    ]
  }
}