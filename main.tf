provider "google" {
  project     = "my-project-id"
  region      = "europe-west1"
}

resource "google_cloud_run_v2_service" "quarkus_noboost" {
  name     = var.service_quarkus
  location = var.region
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "${var.container_registry}/${var.project_id}/cloud-run-source-deploy/${var.repo_name}/${var.service_quarkus}:latest"
      resources {
        limits = {
          cpu    = "1"
          memory = "512Mi"
        }
        startup_cpu_boost = false
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
resource "google_cloud_run_v2_service" "spring_noboost" {
  name     = var.service_spring
  location = var.region
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "${var.container_registry}/${var.project_id}/cloud-run-source-deploy/${var.repo_name}/${var.service_spring}:latest"
      resources {
        limits = {
          cpu    = "1"
          memory = "512Mi"
        }
        startup_cpu_boost = false
      }
      startup_probe {
          http_get {
          path = "/actuator/health/readiness"
          port = 8080
        }
      }
      liveness_probe {
        http_get {
          path = "/actuator/health/liveness"
          port = 8080
        }
      }
    }
    
  }
}
