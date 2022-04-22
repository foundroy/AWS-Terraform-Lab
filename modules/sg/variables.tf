variable "vpcid" {
  description = "vpc id"
  type        = string
}

variable "ssh" {
  description = "ssh port number"
  type        = number
  default     = 22
}

variable "http" {
  description = "http port number"
  type        = number
  default     = 8080
}

variable "protocol_type_ssh" {
  description = "protocol type for security group rule"
  type        = string
  default     = "tcp"
}

variable "cidr_default" {
  description = "Default cidr block 0.0.0.0/0"
  type        = list
  default     = ["0.0.0.0/0"]
}

variable "egress_port" {
  description = "egress from/to port for security groups"
  type        = number
  default     = 0
}