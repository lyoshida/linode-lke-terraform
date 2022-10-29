# check https://registry.terraform.io/providers/linode/linode/latest

terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.29.2" 
    }
  }
}

provider "linode" {
  token = var.LINODE_TOKEN
}