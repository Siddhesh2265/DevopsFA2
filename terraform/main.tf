terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

# Explicitly connect to Docker Desktop via TCP socket
provider "docker" {
  host = "tcp://localhost:2375"
}

# Build Docker Images
resource "docker_image" "backend" {
  name = "app-backend:${var.environment}"
  build {
    context = "${path.module}/../app/backend"
  }
}

resource "docker_image" "frontend" {
  name = "app-frontend:${var.environment}"
  build {
    context = "${path.module}/../app/frontend"
  }
}

# Docker Network
resource "docker_network" "app_network" {
  name = "app-net-${var.environment}"
}

# Backend Container
resource "docker_container" "backend" {
  name  = "backend-${var.environment}"
  image = docker_image.backend.image_id

  env = [
    "APP_ENV=${var.environment}",
    "PORT=5000"
  ]

  ports {
    internal = 5000
    external = var.backend_port
  }

  networks_advanced {
    name = docker_network.app_network.name
  }
}

# Frontend Container
resource "docker_container" "frontend" {
  name  = "frontend-${var.environment}"
  image = docker_image.frontend.image_id

  ports {
    internal = 80
    external = var.frontend_port
  }

  networks_advanced {
    name = docker_network.app_network.name
  }
}