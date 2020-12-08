variable "aliases" {
  type        = list(string)
  default     = ["www.wecarry.app"]
  description = "List of hostname aliases"
}

variable "aws_access_key" {
}

variable "aws_secret_key" {
}

variable "aws_region" {
  default = "us-east-1"
}

variable "bucket_name" {
  default = "www.wecarry.app"
}

variable "codeship_username" {
  default = "codeship"
}

variable "cert_domain_name" {
  default = "wecarry.app"
}

variable "cloudflare_domain" {
  default = "wecarry.app"
}

variable "cloudflare_email" {
  type = string
}

variable "cloudflare_subdomain" {
  default = "www"
}

variable "cloudflare_token" {
  type = string
}

variable "tf_remote_common" {
}

