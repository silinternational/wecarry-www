// Create S3 bucket and CloudFront distribution using Terraform module designed for S3/CloudFront
// configuration of a Hugo site. See: https://registry.terraform.io/modules/fillup/hugo-s3-cloudfront/aws/1.0.1
module "hugosite" {
  source              = "fillup/hugo-s3-cloudfront/aws"
  version             = "4.1.0"
  aliases             = var.aliases
  aws_region          = var.aws_region
  bucket_name         = var.bucket_name
  cert_domain         = var.cert_domain_name
  cf_default_ttl      = "0"
  cf_max_ttl          = "0"
  s3_origin_id        = "www-wecarry-s3-origin"
  deployment_user_arn = data.terraform_remote_state.common.outputs.codeship_arn
  custom_error_response = [
    {
      error_code         = 404
      response_code      = 200
      response_page_path = "/index.html"
    },
  ]
}

// Create DNS CNAME record on Cloudflare
resource "cloudflare_record" "www" {
  domain     = var.cloudflare_domain
  name       = var.cloudflare_subdomain
  type       = "CNAME"
  value      = module.hugosite.cloudfront_hostname
  proxied    = true
  depends_on = [module.hugosite]
}

resource "null_resource" "force_apply" {
  triggers = {
    time = timestamp()
  }
}
