# ---------------------------------------------------------------------------
# Remote state placeholder.
# Terraform does not allow variables inside a `backend` block, so real values
# must be injected at `terraform init` time via `-backend-config` (see the
# GitHub Actions workflow) or a partial-config `backend.hcl` file kept out of
# version control. Values below are dummy placeholders only.
# ---------------------------------------------------------------------------
terraform {
  backend "s3" {
    # Huawei Cloud OBS exposes an S3-compatible API, so the S3 backend works
    # with a custom endpoint. All real values supplied via -backend-config.
    bucket                      = "REPLACE_VIA_BACKEND_CONFIG"
    key                         = "REPLACE_VIA_BACKEND_CONFIG"
    region                      = "REPLACE_VIA_BACKEND_CONFIG"
    endpoint                    = "REPLACE_VIA_BACKEND_CONFIG" # e.g. https://obs.ap-southeast-1.myhuaweicloud.com
    access_key                  = "REPLACE_VIA_BACKEND_CONFIG"
    secret_key                  = "REPLACE_VIA_BACKEND_CONFIG"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    use_path_style              = true
  }
}
