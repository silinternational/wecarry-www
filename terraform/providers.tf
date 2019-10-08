provider "aws" {
  region  = "${var.aws_region}"
  profile = "fillup"
}

provider "cloudflare" {
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}
