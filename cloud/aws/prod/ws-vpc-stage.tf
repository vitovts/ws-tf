# xx-vpc-prod.tf
# ws@2022

module "vpc" {
  source             = "./modules/vpc"

  name               = var.name
  
  environment        = var.environment

  domain             = var.domain

  cidr               = "10.1.0.0/16"

  public_subnets     = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnets    = ["10.1.11.0/24", "10.1.12.0/24"]
  database_subnets   = ["10.1.21.0/24", "10.1.22.0/24"]
  
}