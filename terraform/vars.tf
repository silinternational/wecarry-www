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

variable "cloudflare_account_id" {
}

variable "cloudflare_email" {
  description = "The email associated with the Cloudflare account. Required if the API token is not provided."
  default     = ""
}

variable "cloudflare_token" {
  description = "The Cloudflare API token. This is an alternative to email+api_key. If both are specified, api_token will be used over email+api_key fields."
  default     = ""
}

variable "cloudflare_api_key" {
  description = "The Cloudflare API key. Required if the API token is not provided."
  default     = ""
}
variable "cloudflare_subdomain" {
  default = "www"
}

variable "tf_remote_common" {
}

