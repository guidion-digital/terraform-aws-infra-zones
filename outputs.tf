output "certificate_arns" {
  value = [for this_zone in module.helper_acm_validation : this_zone.certificate_arn]
}
