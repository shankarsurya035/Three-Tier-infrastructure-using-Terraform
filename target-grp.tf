

######### TARGET ###################

resource "aws_lb_target_group" "target" {
  name     = "tf-example-lb-tg"
  depends_on = ["aws_vpc.NewVpc"]
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.NewVpc.id
  target_type = "instance"
#   health_check {
#     interval            = 70
#     path                = "/index.html"
#     port                = 80
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 60 
#     protocol            = "HTTP"
#     matcher             = "200,202"
#   }
}


resource "aws_lb_target_group_attachment" "attach" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.web1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach2" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.web2.id
  port             = 80
}

