variable "aws_region" {
  default = ""
}

variable "service_name" {
  default = ""
  description = "service name"
}

variable "env_name" {
  default = ""
  description = "environment name - for. ex. stage or prod"
}

variable "ecs_role_arn" {
  default = ""
  type = string
}

variable "docker_image_tag" {
  default = ""
  description = "ECR docker image tag using for this service"
}

variable "ecr_repository_url" {
  default = ""
  description = "ecr repository url"
}

variable "cpu_limit" {
  default = "256"
  description = "cpu limit for the task"
}

variable "memory_limit" {
  default = "256"
  description = "memory limit for the task"
}

variable "container_port" {
  default = "8080"
  description = "port expanded by the task"
}

variable "container_port_secondary" {
  default = ""
  description = "port expanded by the task"
}

variable "host_port" {
  default = "0"
  description = "port binded outside - 0 means dynamic port assignment"
}

variable "service_protocol" {
  default = "tcp"
}

variable "cloudwatch_log_group" {
  default = "ecs"
}

variable "cloudwatch_multiline_pattern" {
  default = "^20"
}

variable "ssm_variables" {
  default = {}
}

variable "task_variables" {
  default = {
    "FAKE" = "value"
  }
}

variable "environment_files" {
  type = list(object({
    value = string
    type  = string
  }))
  description = "One or more files containing the environment variables to pass to the container. This maps to the --env-file option to docker run. The file must be hosted in Amazon S3. This option is only available to tasks using the EC2 launch type. This is a list of maps"
  default     = null
}

variable "environment_bucket_id" {
  type = string
  description = "environmental s3 bucket ID - using for create gitlab variables template"
  default = ""
}

variable "mount_points" {
  default = []
}

variable "efs_volume_name" {
  default = ""
}

variable "efs_file_system_id" {
  default = ""
}

variable "efs_access_point_id" {
  default = ""
}

variable "cluster_id" {
  default = ""
  description = "cluster ID"
}

variable "deploy_max_percent" {
  default = 100
}

variable "deploy_min_percent" {
  default = 0
}

variable "desired_count" {
  default = 0
}

variable "healt_check_grace_period" {
  default = 180
  description = "first healt check after startup"
}

variable "launch_type" {
  default = "EC2"
}

variable "lb_dns_name_secondary" {
  default = ""
}

variable "vpc_id" {
  default = ""
}


variable "lb_listener_arn" {
  default = ""
}

variable "lb_listener_arn_secondary" {
  default = ""
}

variable "stickiness_cookie_duration" {
  default = 86400
}

variable "gitlab_branch" {
  default = "main"
}

variable "deployer_id" {
  default = ""
}

variable "deployer_secret" {
  default = ""
}

variable "cluster_name" {
  default = ""
}

variable "healthcheck" {
  type = object({
    command     = list(string)
    retries     = number
    timeout     = number
    interval    = number
    startPeriod = number
  })
  default = null
}

variable "command" {
  type        = list(string)
  description = "The command that is passed to the container"
  default     = null
}

variable "enable_execute_command" {
  default = false
  description = "enable or not ecs exec"
}