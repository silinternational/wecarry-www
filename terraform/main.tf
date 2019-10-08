// Create S3 bucket and CloudFront distribution using Terraform module designed for S3/CloudFront
// configuration of a Hugo site. See: https://registry.terraform.io/modules/fillup/hugo-s3-cloudfront/aws/1.0.1
module "hugosite" {
  source         = "fillup/hugo-s3-cloudfront/aws"
  version        = "2.0.0"
  aliases        = ["${var.aliases}"]
  aws_region     = "${var.aws_region}"
  bucket_name    = "${var.bucket_name}"
  cert_domain    = "${var.cert_domain_name}"
  cf_default_ttl = "0"
  cf_max_ttl     = "0"
  s3_origin_id   = "www-wecarry-s3-origin"
}

// Give Codeship user permission to deploy site to S3
data "template_file" "ui-policy" {
  template = "${file("${path.module}/bucket-policy.json")}"

  vars {
    bucket_name = "${var.cloudflare_subdomain}.${var.cloudflare_domain}"
  }
}

resource "aws_iam_user_policy" "codeship-ui" {
  policy = "${data.template_file.ui-policy.rendered}"
  user   = "${data.terraform_remote_state.common.codeship_username}"
}

// Create DNS CNAME record on Cloudflare
resource "cloudflare_record" "www" {
  domain     = "${var.cloudflare_domain}"
  name       = "${var.cloudflare_subdomain}"
  type       = "CNAME"
  value      = "${module.hugosite.cloudfront_hostname}"
  proxied    = true
  depends_on = ["module.hugosite"]
}
