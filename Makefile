plan:
	terraform plan -var-file=variables.tfvars -out=plan.output
apply:
	terraform apply plan.output