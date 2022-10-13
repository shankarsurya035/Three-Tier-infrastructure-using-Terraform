


#########  NAT ################

resource "aws_nat_gateway" "nat" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.publicsubnet1.id
}