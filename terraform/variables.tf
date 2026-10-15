variable "environment" {
  type        = string
  description = "Target deployment environment (qa, uat, prod)"
}

variable "frontend_port" {
  type        = number
  description = "Host port exposed for the frontend container"
}

variable "backend_port" {
  type        = number
  description = "Host port exposed for the backend container"
}