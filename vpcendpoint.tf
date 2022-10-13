

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.NewVpc.id
  service_name = "com.amazonaws.us-east-1.s3"

  tags = {
    Environment = "test"
  }
}



resource "aws_vpc_endpoint_route_table_association" "example" {
  route_table_id = aws_route_table.privroutes.id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}