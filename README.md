# Terraform AWS Load Balancer Listener Rule module

## Basic usage example

### Forward listener rule
```
module "alb-listener-rule" {
  source       = "github.com/bryan-rhm/terraform-aws-alb-listener-rule?ref=v1.0.0"
  listener_arn = "arn:aws:elasticloadbalancing:us-east-1:1234:listener/app/test"
  priority     = 100
  path_pattern = ["/*"]
  target_groups = [{
    arn = "arn:aws:elasticloadbalancing:us-east-1:1234:targetgroup/test1"
  }]
  query_strings = [{
    value = "user"
  }]
}
```

### Weighted listener rule
```
module "alb-listener-rule" {
  source       = "github.com/bryan-rhm/terraform-aws-alb-listener-rule?ref=v1.0.0"
  listener_arn = "arn:aws:elasticloadbalancing:us-east-1:1234:listener/app/test"
  priority     = 100
  path_pattern = ["/*"]
  target_groups = [{
    arn    = "arn:aws:elasticloadbalancing:us-east-1:1234:targetgroup/test1"
    weight = 80
    }, {
    arn    = "arn:aws:elasticloadbalancing:us-east-1:1234:targetgroup/test2"
    weight = 20
  }]
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.3 |
| aws | >= 3.57.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.57.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_lb_listener_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| host\_header | List of host header patterns to match. The maximum size of each pattern is 128 characters. Comparison is case insensitive. Wildcard characters supported: * | `list(string)` | `[]` | no |
| http\_headers | HTTP Header Blocks, name/values required | <pre>list(object({<br>    name   = string<br>    values = list(string)<br>  }))</pre> | `[]` | no |
| http\_request\_method | List of HTTP request methods or verbs to match. Maximum size is 40 characters. | `list(string)` | `[]` | no |
| listener\_arn | The ARN of the listener to which to attach the rule. | `string` | n/a | yes |
| path\_pattern | List of path patterns to match against the request URL. Maximum size of each pattern is 128 characters. | `list(string)` | `[]` | no |
| priority | The priority for the rule between 1 and 50000. Leaving it unset will automatically set the rule with next available priority after currently existing highest rule | `number` | `null` | no |
| query\_strings | Key/value of query strings pattern to match | <pre>list(object({<br>    key   = optional(string)<br>    value = string<br>  }))</pre> | `[]` | no |
| source\_ip | List of source IP CIDR notations to match. You can use both IPv4 and IPv6 addresses. Wildcards are not supported. | `list(string)` | `[]` | no |
| target\_groups | The ARN and weight of the target groups to attach to the rule. | <pre>list(object({<br>    arn    = string<br>    weight = optional(number)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| output | Listener rule object |
