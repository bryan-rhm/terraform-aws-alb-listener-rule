module "alb-listener-rule" {
  source       = "../../"
  listener_arn = "arn:aws:elasticloadbalancing:us-east-1:1234:listener/app/test"
  priority     = 100
  host_header  = ["www.google.com"]
  path_pattern = ["/*"]
  target_groups = [{
    arn = "arn:aws:elasticloadbalancing:us-east-1:1234:targetgroup/test1"
  }]
  query_strings = [{
    value = "user"
  }]
}

provider "aws" {
  region = "us-east-1"
}