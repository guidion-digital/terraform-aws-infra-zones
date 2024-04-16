terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">= 2.7.0"
      configuration_aliases = [aws.requester, aws.dns_account]
    }
  }
}

module "helper_acm_validation" {
  source   = "app.terraform.io/guidion/helper-acm-validation/aws"
  version  = "1.0.0"
  for_each = var.create_certificates ? toset(var.zones) : []

  providers = {
    aws.dns_account = aws.dns_account
    aws.requester   = aws.requester
  }

  parent_zone = each.value
  subdomains  = { "*" = [] }
  tags        = {}
}
