
############ PUBLIC SUBNETS ##################

resource "aws_subnet" "publicsubnet1" {
  vpc_id     = aws_vpc.NewVpc.id
  cidr_block = "11.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = {
    Name = "publicsubnet1"
  }
}

resource "aws_subnet" "publicsubnet2" {
  vpc_id     = aws_vpc.NewVpc.id
  cidr_block = "11.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"
  tags = {
    Name = "publicsubnet2"
  }
}

##############  PRIVATE SUBNETS ################

resource "aws_subnet" "privatesubnet" {
  vpc_id     = aws_vpc.NewVpc.id
  cidr_block = "11.0.3.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "privatesubnet"
  }
}
