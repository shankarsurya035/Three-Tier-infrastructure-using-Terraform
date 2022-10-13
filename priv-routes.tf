
############# ROUTES TABLE #################
resource "aws_route_table" "privroutes" {
  vpc_id = aws_vpc.NewVpc.id

  tags = {
    Name = "privroutes"
  }
}

############### ROUTES ##################
resource "aws_route" "rp" {
  route_table_id            = aws_route_table.privroutes.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.nat.id
  depends_on                = [aws_route_table.privroutes]
}

############# SUBNET ASSOCIATION - PRIVATE #############
resource "aws_route_table_association" "priv" {
  subnet_id      = aws_subnet.privatesubnet.id
  route_table_id = aws_route_table.privroutes.id
}


