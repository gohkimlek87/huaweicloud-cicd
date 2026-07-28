# ---------------------------------------------------------------------------
# Remote state placeholder.
# Terraform does not allow variables inside a `backend` block, so real values
# must be injected at `terraform init` time via `-backend-config` (see the
# GitHub Actions workflow) or a partial-config `backend.hcl` file kept out of
# version control. Values below are dummy placeholders only.
# ---------------------------------------------------------------------------
terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-singapore"
    key    = "terraform-central.tfstate"
    region = "ap-southeast-3"
    
    endpoints = {
      s3 = "https://obs.ap-southeast-3.myhuaweicloud.com"
    }

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}
