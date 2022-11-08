# variables.tf
# ws@2022

# name app
variable "name" {
  description = "the name of your stack, e.g. \"xx\""
}

# environment
variable "environment" {
  description = "the name of your environment, e.g. \"prod\""
}

# domain
variable "domain" {
  description = "Domain zone"
  default     = "domain.com"
}

# vpc
variable "vpc_id" {
  description = "The VPC ID"
}

# vpc cidr
variable "cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.1.0.0/16" 
}


# sg name
variable "sg_name" {
  description = "SG Name"
}


variable "port_ssh" {
  description = "port ssh"
  default     = "22" 
}

variable "port_http" {
  description = "port http"
  default     = "80" 
}

variable "port_https" {
  description = "port https"
  default     = "443" 
}

variable "port_nodejs" {
  description = "port https"
  default     = "3000" 
}