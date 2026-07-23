#############################################################
# Common Labels
#############################################################

locals {

  common_labels = merge(

    {

      environment = var.environment

      managed_by = "terraform"

      application = "shopping-platform"

      node_pool = var.node_pool_name

    },

    var.node_labels

  )

}
