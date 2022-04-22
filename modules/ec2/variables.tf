variable "public_sn_id" {
  description = "public subnet id"
  type        = string
}

variable "private_sn_id" {
  description = "private subnet id"
  type        = string
}

variable "sg_id" {
  description = "security group id"
  type        = string
}

variable "ami" {
  description = "AMI, default is Amazon cent OS"
  type        = string
  default     = "ami-0f9fc25dd2506cf6d"
}

variable "instance" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}

variable "key" {
  description = "private key .pem file"
  type        = string
  default     = "labkey"
}