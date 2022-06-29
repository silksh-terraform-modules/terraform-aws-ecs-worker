resource "aws_ecs_service" "this" {
    cluster                            = var.cluster_id
    deployment_maximum_percent         = var.deploy_max_percent
    deployment_minimum_healthy_percent = var.deploy_min_percent
    desired_count                      = var.desired_count
    enable_ecs_managed_tags            = false
    health_check_grace_period_seconds  = var.healt_check_grace_period
    launch_type                        = var.launch_type
    name                               = var.service_name
    #propagate_tags                     = "NONE"
    scheduling_strategy                = "REPLICA"
    task_definition                    = aws_ecs_task_definition.this.arn

    deployment_controller {
        type = "ECS"
    }

        ordered_placement_strategy {
        field = "attribute:ecs.availability-zone"
        type  = "spread"
    }

    ordered_placement_strategy {
        field = "instanceId"
        type  = "spread"
    }

    lifecycle {
      ignore_changes = [
        desired_count
      ]
    }
}