# --- VARIABLES ---
# --- ws@2022 ---

# --- FOR INFO ---

variable "name" {
  description = "the name of your stack, e.g. \"client\""
  default     = "xx"
}

variable "environment" {
  description = "the name of your environment, e.g. \"prod\" \"dev\" \"demo\""
  default     = "prod"
}

variable "ownerEmail" {
	description = "ownerEmail"
  default     = "devops@domain.com"
}

variable "team" {
	description = "Team"
  default = "DevOps"
}

variable "deployedby" {
	description = "DeployedBy"
  default     = "tf"
}

variable "domain" {
  description = "Domain zone"
  default     = "domain.com"
}

# --- FOR AWS ---

variable "region" {
  type        = string
  description = "the AWS region in which resources are created"
  default     = "us-east-1"
}