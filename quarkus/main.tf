resource "google_cloud_run_service_iam_binding" "default" {
  location = google_cloud_run_v2_service.default.location
  service  = google_cloud_run_v2_service.default.name
  role     = "roles/run.invoker"
  members = [
    "allUsers"
  ]
}

resource "google_cloud_run_v2_service" "default" {
  name     = var.service_name
  location = var.region
  ingress = "INGRESS_TRAFFIC_ALL"
  

  template {
    execution_environment = EXECUTION_ENVIRONMENT_GEN2
    containers {
      image = "${var.container_registry}/${var.project_id}/cloud-run-source-deploy/${var.repo_name}/${var.image_name}:latest"
      
      resources {
        limits = {
          cpu    = "1"
          memory = "512Mi"
        }
        startup_cpu_boost = var.cpu_boost
        
      }
      startup_probe {
          http_get {
          path = "/q/health/ready"
          port = 8080
        }
      }
      liveness_probe {
        http_get {
          path = "/q/health/live"
          port = 8080
        }
      }
    }
    
  }
}

variable "service_name" {
  type = string
  default = "java-serverless-quarkus"
}
variable "region" {
  type = string
  default = "europe-west1"
}
variable "project_id" {
  type = string
}
variable "repo_name" {
  type = string
  default = "java-serverless"
}
variable "image_name" {
  type = string
  default = "java-serverless-quarkus"
}
variable "container_registry" {
  type = string
}
variable "cpu_boost" {
  type = bool
  default = false
}
