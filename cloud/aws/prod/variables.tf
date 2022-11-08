# --- VARIABLES ---
# --- ws@2022 ---

# --- FOR INFO ---

variable "name" {
  description = "the name of your stack, e.g. \"client\""
}

variable "environment" {
  description = "the name of your environment, e.g. \"prod\" \"dev\" \"demo\""
}

variable "ownerEmail" {
	description = "ownerEmail"
}

variable "team" {
	description = "Team"
}

variable "deployedby" {
	description = "DeployedBy"
}

variable "domain" {
  description = "Domain zone"
  default = "domain.com"
}

# --- FOR AWS ---

variable "region" {
  type        = string
  description = "the AWS region in which resources are created"
  default     = "us-east-1"
}