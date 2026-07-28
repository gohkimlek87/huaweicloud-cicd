terraform {
  required_version = ">= 1.7.0"

  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "~> 1.68"
    }
  }
}

provider "huaweicloud" {
  region     = var.hw_region
  access_key = var.hw_access_key
  secret_key = var.hw_secret_key

  # Prefer assume-role / project-scoped auth over static account keys where possible.
  # If using an Agency (cross-account) role instead of AK/SK, set assume_role block:
  # assume_role {
  #   agency_name  = var.hw_assume_role_agency_name
  #   domain_name  = var.hw_assume_role_domain_name
  #   session_name = var.hw_assume_role_session_name
  # }
}
