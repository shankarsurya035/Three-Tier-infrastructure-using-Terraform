


############# SUBNET GRP ##################

resource "aws_db_subnet_group" "sub-grp" {
  name       = "main"
  subnet_ids = [aws_subnet.publicsubnet1.id, aws_subnet.privatesubnet.id]

  tags = {
    Name = "sub-grp"
  }
}

############## RDS ######################

resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.m6g.xlarge"
  username             = "surya"
  password             = "nSf5XnBY2L8fs8"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.sub-grp.id
  publicly_accessible  = true
  multi_az             =  false 
}
