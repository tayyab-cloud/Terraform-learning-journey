provider "aws" {
  
}


terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.25.0" # Ya jo latest ho
    }
  }
}

provider "vault" {
  # Yahan apni EC2 ki PUBLIC IP likho
  address = "http://35.175.182.69:8200"
  
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      # Jo Notepad me copy kia tha wo yahan paste karo
      role_id   = "6c2a57eb-471a-a74c-ead1-bac5e06fd74a"
      secret_id = "d122c32f-be7c-ee08-9f3b-88210568ee7e"
    }
  }
}

# Ye block Vault se Secret FETCH karega (Read karega)
data "vault_kv_secret_v2" "example" {
  mount = "kv"           # Jo humne browser me engine banaya tha
  name  = "test-secret"  # Secret ka naam
}

resource "aws_instance" "this" {
  ami           = var.ami_ubuntu
  instance_type = "t2.micro"

  tags = {
    Name = "Vault-EC2-Instance"
    FetchedSecret     = data.vault_kv_secret_v2.example.data["username"]
  }

  
}

# Test karne ke liye ke secret aya ya nahi, hum output use karenge
output "secret_value" {
  # Ye sensitive true isliye hai taake terminal pe password direct na dikhe
  value     = data.vault_kv_secret_v2.example.data["username"]
  sensitive = true
}