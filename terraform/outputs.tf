output "vpc_id" {
  description = "ID of the created VPC"
  value       = huaweicloud_vpc.this.id
}

output "subnet_id" {
  description = "ID of the created VPC subnet"
  value       = huaweicloud_vpc_subnet.this.id
}

output "security_group_id" {
  description = "ID of the created security group"
  value       = huaweicloud_networking_secgroup.this.id
}

output "ecs_instance_ids" {
  description = "IDs of provisioned ECS instances"
  value       = huaweicloud_compute_instance.this[*].id
}

output "ecs_instance_private_ips" {
  description = "Private IPs of provisioned ECS instances"
  value       = huaweicloud_compute_instance.this[*].access_ip_v4
}
