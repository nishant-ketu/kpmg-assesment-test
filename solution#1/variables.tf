variable "environment" {
  description = "The environment name"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "The region where the infrastructure will be deployed"
  type        = string
  default     = "us-west1"
}

variable "vm_type" {
 default = ""
}

variable "ubuntu22_image" {
 default = ""
}

variable "db_availability" {
 default = ""
}

variable "db_tier" {
 default = ""
}