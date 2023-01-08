# https://registry.terraform.io/providers/linode/linode/latest/docs/resources/lke_cluster

resource "linode_lke_cluster" "my-cluster" {
    label       = var.CLUSTER_LABEL
    k8s_version = "1.24"
    region      = var.LINODE_REGION
    tags        = [var.ENV]

    pool {
        type  = var.LINODE_SERVER_TYPE
        count = var.SERVER_COUNT

        autoscaler {
            min = var.SERVER_AUTOSCALE_MIN
            max = var.SERVER_AUTOSCALE_MAX
        }
    }

    # Prevent the count field from overriding autoscaler-created nodes
    lifecycle {
        ignore_changes = [
            pool.0.count
        ]
    }
}