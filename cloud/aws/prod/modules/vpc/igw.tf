# igw.tf
# ws@2022

# Create internet gateway 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "${var.name}-igw-vpc-${var.environment}"
    Create      = "terraform with resource"
    
  }

}


