
terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      version = "~> 2.70"
      source  = "hashicorp/aws"
    }
    cloudflare = {
      version = "~> 2.0"
      source  = "cloudflare/cloudflare"
    }
    null = {
      version = "~> 3.0"
      source  = "hashicorp/null"
    }
    template = {
      version = "~> 2.2"
      source  = "hashicorp/template"
    }
  }
}
