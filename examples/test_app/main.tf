# In a real case this first provider would assume into a role in another account
# holding the Route53 zones, whilst the second would be the account we want to
# create the zones _from_ (this one)
provider "aws" {
  alias  = "dns_account"
  region = "us-east-1"
}
provider "aws" {
  alias  = "requester"
  region = "us-east-1"
}

module "zones" {
  providers = {
    aws.dns_account = aws.dns_account
    aws.requester   = aws.requester
  }

  source   = "../../"
  for_each = ["example.com"]

  create_certificates = false
  zones               = each.value.zones
  assume_accounts     = each.value.accounts
}
