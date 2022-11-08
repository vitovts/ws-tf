# vpc.tf
# ws@2022

# Create vpc 
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.name}-vpc-${var.environment}"
    Create      = "terraform with resource"
    
  }
}

