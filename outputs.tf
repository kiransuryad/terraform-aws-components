# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# RDS instance endpoint
# This code outputs the RDS instance endpoint, which is used by the
# application to connect to the database.

output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.talbot_devops_poc.address
  sensitive   = false
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.talbot_devops_poc.port
  sensitive   = false
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.talbot_devops_poc.username
  sensitive   = false
}
