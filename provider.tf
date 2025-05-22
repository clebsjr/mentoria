terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.94.1" // versão do provider
    }
  }
  backend "s3" {        // Terraform State Remoto
    bucket = "clebinho" // bucket criado para armazenar o state
    key    = "dev/terraform.tfstate"
    region = "us-east-1" // regiao onde o bucket foi criado
    // dynamodb_table = "token-terraform-state-lock-dynamo" // state lock, quando 2 pessoas estao alterando ao mesmo tempo, temos um lock para não quebrar o plan
  }
  required_version = ">= 1.11.4" // versão do terraform
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "dev"
      Owner       = "Cleberton Junior"
      ManagedBy   = "Terraform"
    }
  }
}
