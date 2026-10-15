output "frontend_url" {
  value       = "http://localhost:${var.frontend_port}"
  description = "Access URL for Frontend Application"
}

output "backend_health_url" {
  value       = "http://localhost:${var.backend_port}/api/health"
  description = "Health Check URL for Backend API"
}