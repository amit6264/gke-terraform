resource "google_artifact_registry_repository" "docker_repo" {

  project = var.project_id
  location = var.region

  repository_id = var.repository_name

  description = var.description

  format = "DOCKER"

  cleanup_policies {

    id = "delete-old-images"

    action = "DELETE"

    condition {

      older_than = "30d"

    }

  }

  cleanup_policies {

    id = "keep-latest"

    action = "KEEP"

    most_recent_versions {

      keep_count = 10

    }

  }
}
