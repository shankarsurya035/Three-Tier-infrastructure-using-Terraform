
########### INTERNET GW #############

resource "aws_internet_gateway" "newigw" {
  vpc_id = aws_vpc.NewVpc.id

  tags = {
    Name = "newigw"
  }
}