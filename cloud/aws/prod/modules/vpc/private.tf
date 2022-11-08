# private.tf
# ws@2022

# Create private subnets 
resource "aws_subnet" "private_subnets" {

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.private_subnets, count.index)
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)

  count             = length(var.private_subnets)

  tags = {
    Name        = "${var.name}-private-subnet-${element(data.aws_availability_zones.azs.names, count.index)}"
    Create      = "terraform with resource"
    
  }

}

# --- ROUTE TABLE (RT) AND ROUTE ---

# Create route table
resource "aws_route_table" "private_route_table" {

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "${var.name}-private-route-table-${var.environment}"
    Create      = "terraform with resource"
  }
}

# Create route for access to inet
# resource "aws_route" "private_route" {
#   route_table_id         = aws_route_table.private_route_table.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.igw.id
# }

# Create route table association
resource "aws_route_table_association" "private_route_table_association" {
  count          = length(var.private_subnets)
  subnet_id      = element(aws_subnet.private_subnets.*.id, count.index)
  route_table_id = element(aws_route_table.private_route_table.*.id, count.index)

  depends_on    = [aws_route_table.private_route_table]

}




