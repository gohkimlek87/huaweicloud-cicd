locals {
  name_prefix = "${var.project_name}-${var.environment}"

  tags = merge(
    var.common_tags,
    {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  )
}

resource "huaweicloud_vpc" "this" {
  name = "${local.name_prefix}-vpc"
  cidr = var.vpc_cidr
  tags = local.tags
}

resource "huaweicloud_vpc_subnet" "this" {
  name       = "${local.name_prefix}-subnet"
  vpc_id     = huaweicloud_vpc.this.id
  cidr       = var.subnet_cidr
  gateway_ip = cidrhost(var.subnet_cidr, 1)
  tags       = local.tags
}

resource "huaweicloud_networking_secgroup" "this" {
  name        = "${local.name_prefix}-sg"
  description = "Managed by terraform for ${local.name_prefix}"
}

resource "huaweicloud_networking_secgroup_rule" "egress_all" {
  direction         = "egress"
  ethertype         = "IPv4"
  security_group_id = huaweicloud_networking_secgroup.this.id
}

resource "huaweicloud_compute_instance" "this" {
  count = var.ecs_instance_count

  name              = "${local.name_prefix}-ecs-${count.index}"
  image_id          = var.ecs_image_id
  flavor_id         = var.ecs_flavor_id
  security_groups   = [huaweicloud_networking_secgroup.this.name]
  availability_zone = var.availability_zone
  admin_pass        = var.ecs.admin_pass

  network {
    uuid = huaweicloud_vpc_subnet.this.id
  }

  tags = local.tags

  lifecycle {
    create_before_destroy = true
  }
}
