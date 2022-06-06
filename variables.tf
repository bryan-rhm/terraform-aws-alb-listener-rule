variable "target_groups" {
  description = "The ARN and weight of the target groups to attach to the rule."
  type = list(object({
    arn    = string
    weight = optional(number)
  }))
}

variable "listener_arn" {
  description = "The ARN of the listener to which to attach the rule."
  type        = string
}

variable "priority" {
  description = "The priority for the rule between 1 and 50000. Leaving it unset will automatically set the rule with next available priority after currently existing highest rule"
  default     = null
  type        = number
}

variable "host_header" {
  description = "List of host header patterns to match. The maximum size of each pattern is 128 characters. Comparison is case insensitive. Wildcard characters supported: *"
  default     = []
  type        = list(string)
}

variable "path_pattern" {
  description = "List of path patterns to match against the request URL. Maximum size of each pattern is 128 characters."
  default     = []
  type        = list(string)
}

variable "http_request_method" {
  description = "List of HTTP request methods or verbs to match. Maximum size is 40 characters."
  default     = []
  type        = list(string)
}

variable "source_ip" {
  description = "List of source IP CIDR notations to match. You can use both IPv4 and IPv6 addresses. Wildcards are not supported."
  default     = []
  type        = list(string)
}

variable "query_strings" {
  description = "Key/value of query strings pattern to match"
  default     = []
  type = list(object({
    key   = optional(string)
    value = string
  }))
}

variable "http_headers" {
  description = "HTTP Header Blocks, name/values required"
  default     = []
  type = list(object({
    name   = string
    values = list(string)
  }))
}

variable "oidc_config" {
  description = "Open ID Connect Configuration"
  type = object({
    authorization_endpoint = string
    client_id              = string
    client_secret          = string
    issuer                 = string
    token_endpoint         = string
    user_info_endpoint     = string
  })
  default = null
}
