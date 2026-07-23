project_id = "my-shopping-project"

region = "europe-west1"

zone = "europe-west1-b"

environment = "dev"

network_name = "shopping-vpc"

subnet_name = "gke-private-subnet"

subnet_cidr = "10.10.0.0/20"

pods_cidr = "10.20.0.0/16"

services_cidr = "10.30.0.0/20"

repository_name = "shopping-repository"

cluster_name = "shopping-gke"

admin_cidr = "106.222.213.180/32"

node_pool_name = "primary-pool"

machine_type = "e2-standard-2"

disk_size_gb = 100

disk_type = "pd-balanced"

min_node_count = 2

max_node_count = 8
