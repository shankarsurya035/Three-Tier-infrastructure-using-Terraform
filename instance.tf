

#key Pairs
resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}


#Ec2 instance [Public Server]
resource "aws_instance" "web1" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.key-tf.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  subnet_id = "${aws_subnet.publicsubnet1.id}"
  user_data = file("${path.module}/web_server.sh")
  tags = {
    Name = "web1"
  }
}

output "public_ipv4_address" {
  value = aws_instance.web1.public_ip
}


#Ec2 instance [Public Server]
resource "aws_instance" "web2" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.key-tf.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  subnet_id = "${aws_subnet.publicsubnet2.id}"
  user_data = file("${path.module}/web_server.sh")
  tags = {
    Name = "web2"
  }
}

output "public_ipv4_address2" {
  value = aws_instance.web2.public_ip
}


# output "public_ipv4_address1" {
#   value = aws_instance.web2.public_ip
# }

#Ec2 instance [Private Server]
resource "aws_instance" "web" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.key-tf.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  subnet_id = "${aws_subnet.privatesubnet.id}"
  tags = {
    Name = "web"
  }
}
