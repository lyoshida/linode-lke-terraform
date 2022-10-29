# Linode Kubernetes Cluster Creator

Creates a kubernetes cluster on Linode.

# Set up

Create a `variables.tfvars`

`cp variables.tfvars.example variables.tfvars`

Edit its contents:

```
ENV = "production"
LINODE_REGION = "us-east"
CLUSTER_LABEL = "my-cluster"
SERVER_COUNT = 1
SERVER_AUTOSCALE_MIN = 1
SERVER_AUTOSCALE_MAX = 10
```

Check possible values in `variables.tf`


Create a `.env` file:

`cp .env.sample .env`

Add the Linode token:

```
LINODE_TOKEN = 
```

# Creating the cluster

Run:

`make plan` 

and to apply changes:

`make apply`