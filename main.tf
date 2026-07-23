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




module "iam" {

  source = "./modules/iam"

  project_id = var.project_id

  environment = var.environment

  depends_on = [
    module.apis
  ]
}


module "gke" {

  source = "./modules/gke"

  depends_on = [
    module.network,
    module.iam
  ]

  project_id = var.project_id

  region = var.region

  cluster_name = var.cluster_name

  network = module.network.network_name

  subnetwork = module.network.subnet_name

  pods_secondary_range_name = module.network.pods_secondary_range_name

  services_secondary_range_name = module.network.services_secondary_range_name

  environment = var.environment

  admin_cidr = var.admin_cidr

}


module "nodepool" {

  source = "./modules/nodepool"

  depends_on = [
    module.gke
  ]

  project_id = var.project_id

  region = var.region

  cluster_name = module.gke.cluster_name

  node_pool_name = var.node_pool_name

  machine_type = var.machine_type

  disk_size_gb = var.disk_size_gb

  disk_type = var.disk_type

  min_node_count = var.min_node_count

  max_node_count = var.max_node_count

  service_account = module.iam.gke_node_sa_email

}
