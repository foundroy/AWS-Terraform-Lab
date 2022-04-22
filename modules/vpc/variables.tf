variable "cidr_vpc" {
  description = "CIDR block for VPC"
  type        = string
  default     = "100.64.0.0/16"
}

variable "cidr_default" {
  description = "default cidr block"
  type        = string
  default     = "0.0.0.0/0"
}

variable "cidr_sn_public" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "100.64.1.0/24"
}

variable "cidr_sn_private" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "100.64.2.0/24"
}

variable "az" {
  description = "availability zone"
  type        = string
  default     = "us-east-1a"
}