resource "aws_lb_listener_rule" "this" {
  listener_arn = var.listener_arn
  priority     = var.priority

  action {
    type             = "forward"
    target_group_arn = length(var.target_groups) == 1 ? var.target_groups[0].arn : null

    dynamic "forward" {
      for_each = length(var.target_groups) > 1 ? [1] : []
      content {
        dynamic "target_group" {
          for_each = var.target_groups
          content {
            arn    = target_group.value.arn
            weight = try(target_group.value.weight, null)
          }
        }
      }
    }
  }

  dynamic "condition" {
    for_each = length(var.host_header) > 0 ? [1] : []
    content {
      host_header {
        values = var.host_header
      }
    }
  }

  dynamic "condition" {
    for_each = length(var.path_pattern) > 0 ? [1] : []
    content {
      path_pattern {
        values = var.path_pattern
      }
    }
  }

  dynamic "condition" {
    for_each = length(var.http_request_method) > 0 ? [1] : []
    content {
      http_request_method {
        values = var.http_request_method
      }
    }
  }

  dynamic "condition" {
    for_each = length(var.source_ip) > 0 ? [1] : []
    content {
      source_ip {
        values = var.source_ip
      }
    }
  }

  dynamic "condition" {
    for_each = { for header in var.http_headers : header.name => header }
    content {
      http_header {
        values           = condition.value.values
        http_header_name = condition.value.name
      }
    }
  }

  dynamic "condition" {
    for_each = { for query in var.query_strings : query.value => query }
    content {
      query_string {
        key   = try(condition.value.key, null)
        value = condition.value.value
      }
    }
  }
}
