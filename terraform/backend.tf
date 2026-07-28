# ---------------------------------------------------------------------------
# Remote state placeholder.
# Terraform does not allow variables inside a `backend` block, so real values
# must be injected at `terraform init` time via `-backend-config` (see the
# GitHub Actions workflow) or a partial-config `backend.hcl` file kept out of
# version control. Values below are dummy placeholders only.
# ---------------------------------------------------------------------------
terraform {
  backend "s3" {
  }
}
