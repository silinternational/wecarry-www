output "cloudfront_hostname" {
  value       = module.hugosite.cloudfront_hostname
  description = "CloudFront DNS hostname to create a CNAME to with DNS provider"
}

