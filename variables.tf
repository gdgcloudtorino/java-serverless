variable "service_spring" {
  default = "java-serverless-spring"
}

variable "service_quarkus" {
  default = "java-serverless-quarkus"
}
variable "container_registry" {
  default = "europe-west1-docker.pkg.dev"
}
variable "project_id" {
  type = string
}
variable "repo_name" {
  default = "java-serverless"
}
variable "region" {
  default = "europe-west1"
}