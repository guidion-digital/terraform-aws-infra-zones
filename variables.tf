variable "zones" {
  description = "The zones to create"
  type        = list(string)
}

variable "assume_accounts" {
  description = "Which accounts are allowed to assume a role to edit these zones"
  type        = list(string)
}

variable "create_certificates" {
  description = "Whether to attempt DNS validation for the ACM certificates"
  type        = bool
  default     = true
}

