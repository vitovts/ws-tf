# database.tf
# ws@2022

# Create database subnets
resource "aws_subnet" "database_subnets" {

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = element(var.database_subnets, count.index)
  availability_zone       = element(data.aws_availability_zones.azs.names, count.index)

  count                   = length(var.database_subnets)

  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.name}-database-subnet-${var.environment}-${element(data.aws_availability_zones.azs.names, count.index)}"
    Create      = "terraform with resource"
    
  }

}

# --- ROUTE TABLE (RT) AND ROUTE ---

# Create route table
resource "aws_route_table" "database_route_table" {

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "${var.name}-database-route-table-${var.environment}"
    Create      = "terraform with resource"
  }
}

# Create route 
# !!! THEN LOCK !!!
# resource "aws_route" "database_route" {
#   route_table_id         = aws_route_table.database_route_table.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.igw.id
# }

# Create route table association
resource "aws_route_table_association" "database_route_table_association" {
  count          = length(var.database_subnets)
  subnet_id      = element(aws_subnet.database_subnets.*.id, count.index)
  route_table_id = aws_route_table.database_route_table.id

  depends_on    = [aws_route_table.database_route_table]

}
