
############# ROUTES TABLE #################
resource "aws_route_table" "pubroutes1" {
  vpc_id = aws_vpc.NewVpc.id

  tags = {
    Name = "pubroutes1"
  }
}

############### ROUTES ##################
resource "aws_route" "r" {
  route_table_id            = aws_route_table.pubroutes1.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.newigw.id
  depends_on                = [aws_route_table.pubroutes1]
}

############# SUBNET ASSOCIATION - PUBLIC #############
resource "aws_route_table_association" "pub" {
  subnet_id      = aws_subnet.publicsubnet1.id
  route_table_id = aws_route_table.pubroutes1.id
}



resource "aws_route_table" "pubroutes2" {
  vpc_id = aws_vpc.NewVpc.id

  tags = {
    Name = "pubroutes2"
  }
}

############### ROUTES ##################
resource "aws_route" "r2" {
  route_table_id            = aws_route_table.pubroutes2.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.newigw.id
  depends_on                = [aws_route_table.pubroutes2]
}

############# SUBNET ASSOCIATION - PUBLIC #############
resource "aws_route_table_association" "pub2" {
  subnet_id      = aws_subnet.publicsubnet2.id
  route_table_id = aws_route_table.pubroutes2.id
}