
terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = {
      version = "~> 2.70"
      source  = "hashicorp/aws"
    }
    template = {
      version = "~> 2.2"
      source  = "hashicorp/template"
    }
    cloudflare = {
      version = "~> 2.0"
      source  = "cloudflare/cloudflare"
    }
  }
}
