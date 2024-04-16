This example shows a run through a map of stages, each supplying `zones` and `account` for use with the module's `zone` and `assume_accounts` fields.

The boolean `var.create_certificates` is useful for when nameservers are not yet pointing to these zones.

Usage of the module requires supplying two providers, as in the example: `aws.dns_account` and `aws.requester`. See the [ACM Validation module](https://github.com/GuidionOps/terraform-aws-helper-acm-validation) for details on why this is.
