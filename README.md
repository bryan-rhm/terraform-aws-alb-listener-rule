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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.57.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.71.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb_listener_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_host_header"></a> [host\_header](#input\_host\_header) | List of host header patterns to match. The maximum size of each pattern is 128 characters. Comparison is case insensitive. Wildcard characters supported: * | `list(string)` | `[]` | no |
| <a name="input_http_headers"></a> [http\_headers](#input\_http\_headers) | HTTP Header Blocks, name/values required | <pre>list(object({<br>    name   = string<br>    values = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_http_request_method"></a> [http\_request\_method](#input\_http\_request\_method) | List of HTTP request methods or verbs to match. Maximum size is 40 characters. | `list(string)` | `[]` | no |
| <a name="input_listener_arn"></a> [listener\_arn](#input\_listener\_arn) | The ARN of the listener to which to attach the rule. | `string` | n/a | yes |
| <a name="input_oidc_config"></a> [oidc\_config](#input\_oidc\_config) | Open ID Connect Configuration | <pre>object({<br>    authorization_endpoint = string<br>    client_id              = string<br>    client_secret          = string<br>    issuer                 = string<br>    token_endpoint         = string<br>    user_info_endpoint     = string<br>    scope                  = optional(string) # The set of user claims to be requested from the IdP.<br>  })</pre> | `null` | no |
| <a name="input_path_pattern"></a> [path\_pattern](#input\_path\_pattern) | List of path patterns to match against the request URL. Maximum size of each pattern is 128 characters. | `list(string)` | `[]` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | The priority for the rule between 1 and 50000. Leaving it unset will automatically set the rule with next available priority after currently existing highest rule | `number` | `null` | no |
| <a name="input_query_strings"></a> [query\_strings](#input\_query\_strings) | Key/value of query strings pattern to match | <pre>list(object({<br>    key   = optional(string)<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_source_ip"></a> [source\_ip](#input\_source\_ip) | List of source IP CIDR notations to match. You can use both IPv4 and IPv6 addresses. Wildcards are not supported. | `list(string)` | `[]` | no |
| <a name="input_target_groups"></a> [target\_groups](#input\_target\_groups) | The ARN and weight of the target groups to attach to the rule. | <pre>list(object({<br>    arn    = string<br>    weight = optional(number)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_output"></a> [output](#output\_output) | Listener rule attributes |
