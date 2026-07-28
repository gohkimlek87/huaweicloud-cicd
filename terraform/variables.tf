# ---------------------------------------------------------------------------
# Provider / auth
# ---------------------------------------------------------------------------
variable "hw_region" {
  description = "Huawei Cloud region, e.g. ap-southeast-1"
  type        = string
}

variable "hw_access_key" {
  description = "Huawei Cloud AK (injected via TF_VAR_hw_access_key from CI secrets)"
  type        = string
  sensitive   = true
}

variable "hw_secret_key" {
  description = "Huawei Cloud SK (injected via TF_VAR_hw_secret_key from CI secrets)"
  type        = string
  sensitive   = true
}

variable "hw_project_id" {
  description = "Huawei Cloud project ID for the target region"
  type        = string
}

# ---------------------------------------------------------------------------
# Naming / tagging
# ---------------------------------------------------------------------------
variable "project_name" {
  description = "Short project identifier used for resource naming"
  type        = string
}

variable "environment" {
  description = "Deployment environment name (e.g. dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "common_tags" {
  description = "Common tags/labels applied to all taggable resources"
  type        = map(string)
  default     = {}
}

# ---------------------------------------------------------------------------
# Networking
# ---------------------------------------------------------------------------
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the primary subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for zonal resources"
  type        = string
}

# ---------------------------------------------------------------------------
# Compute (ECS example workload)
# ---------------------------------------------------------------------------
variable "ecs_flavor_id" {
  description = "Huawei Cloud ECS flavor/instance type ID"
  type        = string
}

variable "ecs_image_id" {
  description = "Image ID used for the ECS instance"
  type        = string
}

variable "key_pair_name" {
  description = "Name of the existing Huawei Cloud key pair for SSH access"
  type        = string
}

variable "ecs_admin_pass" {
  description = "Admin password for the ECS instance"
  type        = string
  sensitive   = true
}

variable "ecs_instance_count" {
  description = "Number of ECS instances to provision"
  type        = number
  default     = 1
}
