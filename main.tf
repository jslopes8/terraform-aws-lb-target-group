

resource "aws_alb_target_group" "alb_target_group" {  
    name     = var.name
    port     = var.port  
    protocol = var.protocol
    vpc_id   = var.vpc_id   

    dynamic "stickiness" {
        for_each    = length(keys(var.stickiness)) == 0 ? [] : [var.stickiness]
        content {
            type            = lookup(stickiness.value, "type", null)
            cookie_duration = lookup(stickiness.value, "cookie_duration", null)
            enabled         = lookup(stickiness.value, "enabled", null)
        }
    }

    dynamic "health_check" {
        for_each    = var.health_check
        content {
            healthy_threshold   = health_check.value.healthy_threshold
            unhealthy_threshold = health_check.value.unhealthy_threshold
            timeout             = health_check.value.timeout 
            interval            = health_check.value.interval
            path                = health_check.value.path
            port                = health_check.value.port
        }
    }

    tags    = var.default_tags
}
