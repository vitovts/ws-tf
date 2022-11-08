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
}

# vpc cidr
variable "cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.1.0.0/16" 
}

# public subnets
variable "public_subnets" {
  description = "List of public subnets"
}

# private subnets
variable "private_subnets" {
  description = "List of private subnets"
}

# database subnets
variable "database_subnets" {
  description = "List of database subnets"
}

