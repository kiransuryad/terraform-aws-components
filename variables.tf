
# This is the configuration for the RDS database.
# This configuration is used by the RDS module.
# The database password is sensitive data so it is marked as such.



# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "db_password" {
  description = "RDS root user password"
  sensitive   = true
  default     = "talbot_devops_poc"
}
