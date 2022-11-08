# public.tf
# ws@2022

# Create public subnets
resource "aws_subnet" "public_subnets" {

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = element(var.public_subnets, count.index)
  availability_zone       = element(data.aws_availability_zones.azs.names, count.index)

  count                   = length(var.public_subnets)

  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.name}-public-subnet-${element(data.aws_availability_zones.azs.names, count.index)}"
    Create      = "terraform with resource"
    
  }

}

# --- ROUTE TABLE (RT) AND ROUTE ---

# Create route table
resource "aws_route_table" "public_route_table" {

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "${var.name}-public-rt-${var.environment}"
    Create      = "terraform with resource"
  }
}

# Create route
resource "aws_route" "public-route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Create route table association
resource "aws_route_table_association" "public_route_table_association" {
  count          = length(var.public_subnets)
  subnet_id      = element(aws_subnet.public_subnets.*.id, count.index)
  route_table_id = aws_route_table.public_route_table.id

  depends_on    = [aws_route_table.public_route_table]

}


