module "apis" {
  source = "./modules/apis"

  project_id = var.project_id
}



module "network" {

  depends_on = [
    module.apis
  ]

  source = "./modules/network"

  project_id = var.project_id

  region = var.region

  network_name = var.network_name

  subnet_name = var.subnet_name

  subnet_cidr = var.subnet_cidr

  pods_cidr = var.pods_cidr

  services_cidr = var.services_cidr
}



module "artifact_registry" {

  source = "./modules/artifact-registry"

  depends_on = [
    module.apis
  ]

  project_id = var.project_id

  region = var.region

  repository_name = var.repository_name
}
