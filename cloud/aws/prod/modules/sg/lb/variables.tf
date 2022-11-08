# --- VARIABLES ---
# --- ws@2022 ---

variable "name" {
  description = "the name of your stack, e.g. \"demo\""
}

variable "environment" {
  description = "the name of your environment, e.g. \"prod\""
}

variable "domain" {
  description = "Domain zone"
  default     = "domain.com"
}

# --- VPC ---

variable "vpc_id" {
  description = "The VPC ID"
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.1.0.0/16" 
}

# sg name
variable "sg_name" {
  description = "SG Name"
}

# port http
variable "port_http" {
  description = "port http"
  default     = "80" 
}

# port https
variable "port_https" {
  description = "port https"
  default     = "443" 
}

