provider "aws" {
  region = "eu-central-1"
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

provider "vault" {
  auth_login {
    path = "auth/userpass/login/${var.username}"
    parameters = {
      password = var.password
    }
  }
}

data "vault_generic_secret" "db_user" {
  path = "secret/authtoken"
}

data "vault_generic_secret" "db_pwd" {
  path = "secret/authtoken"
}

resource "aws_db_instance" "myRDS" {
  name                = "my_db"
  identifier          = "my-first-rds"
  instance_class      = "db.t2.micro"
  engine              = "mysql"
  engine_version      = "8.0"
  username            = data.vault_generic_secret.db_user
  password            = data.vault_generic_secret.db_pwd
  port                = 3306
  allocated_storage   = 20
  skip_final_snapshot = true
}