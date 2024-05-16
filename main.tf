provider "google" {
  region      = "europe-west1"
}

module "quarkus_noboost" {
  source = "./quarkus"
  project_id = var.project_id
  container_registry = var.container_registry
  cpu_boost = false
  image_name = var.service_quarkus
  service_name = "${var.service_quarkus}-noboost"
  region = var.region
}
module "quarkus_boost" {
  source = "./quarkus"
  project_id = var.project_id
  container_registry = var.container_registry
  cpu_boost = true
  image_name = var.service_quarkus
  service_name = "${var.service_quarkus}-boost"
  region = var.region
}
module "quarkus_native" {
  source = "./quarkus"
  project_id = var.project_id
  container_registry = var.container_registry
  cpu_boost = true
  image_name = var.service_quarkus
  region = var.region
  service_name = "${var.service_quarkus}-native"
}

    
  
module "spring_noboost" {
  source = "./spring"
  project_id = var.project_id
  container_registry = var.container_registry
  cpu_boost = false
  image_name = var.service_spring
  service_name = "${var.service_spring}-noboost"
  region = var.region
}
module "spring_boost" {
  source = "./spring"
  project_id = var.project_id
  container_registry = var.container_registry
  cpu_boost = true
  image_name = var.service_spring
  service_name = "${var.service_spring}-boost"
  region = var.region
}
module "spring_native" {
  source = "./spring"
  project_id = var.project_id
  container_registry = var.container_registry
  cpu_boost = true
  image_name = var.service_spring
  region = var.region
  service_name = "${var.service_spring}-native"
}