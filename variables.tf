variable "LINODE_TOKEN" {
    type = string
    description = "Your Linode token"
    
    validation {
        condition = var.LINODE_TOKEN != ""
        error_message = "TF_VAR_LINODE_TOKEN environment variable is missing"
    }
}

variable "ENV" {
    type = string
    default = "production"
    description = "The environment type (staging or production)"

    validation {
    condition = contains(["staging", "production"], var.ENV)
    error_message = "ENV value must be staging or production."
  }
}

variable "CLUSTER_LABEL" {
    type = string
    default = "my-cluster"
    description = "The name of the cluster"
}

variable "LINODE_REGION" {
    type = string
    default = "us-east"
    description = "The cluster region"
    
    validation {
        condition = contains(
            [
                "us-central",
                "us-west",
                "us-southeast",
                "us-east",
                "eu-west",
                "ap-south",
                "eu-central",
                "ap-northeast",
                "ap-northeast-1a"
            ], 
            var.LINODE_REGION
        )
        error_message = "LINODE_REGION is invalid"
    }
}

variable "LINODE_SERVER_TYPE" {
    type = string
    default = "g6-standard-1"
    description = "The Linode instance type"

    validation {
        condition = contains(
            [
                "g6-nanode-1",
                "g6-standard-1",
                "g6-standard-2",
                "g6-standard-4",
                "g6-standard-6",
                "g6-standard-8",
                "g6-standard-16",
                "g6-standard-20",
                "g6-standard-24",
                "g6-standard-32",
                "g6-highmem-1",
                "g6-highmem-2",
                "g6-highmem-4",
                "g6-highmem-8",
                "g6-highmem-16"

            ],
            var.LINODE_SERVER_TYPE
        )
        error_message = "LINODE_SERVER_TYPE is invalid"
    }
}

variable "SERVER_COUNT" {
    type = number
    default = 1
    description = "The number of nodes in the cluster"

    validation {
        condition = var.SERVER_COUNT >= 1 && var.SERVER_COUNT <= 10
        error_message = "SERVER_COUNT must be 1-10"
    }
}

variable "SERVER_AUTOSCALE_MIN" {
    type = number
    default = 1
    description = "The minimum number of nodes when autoscaling"
    
    validation {
      condition = var.SERVER_AUTOSCALE_MIN >= 1
      error_message = "SERVER_AUTOSCALE_MIN must be greater than 0"
    }
}

variable "SERVER_AUTOSCALE_MAX" {
    type = number
    default = 1
    description = "The maximum number of nodes when autoscaling"
    
    validation {
      condition = var.SERVER_AUTOSCALE_MAX <= 10
      error_message = "SERVER_AUTOSCALE_MAX must less or equal to 10"
    }
}