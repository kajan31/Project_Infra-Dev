# Install Terraform v0.13.X (https://www.terraform.io/downloads.html)
# Export AWS AK / SK for using Terraform
# export AWS_ACCESS_KEY_ID=
# export AWS_SECRET_ACCESS_KEY=
infra_test:
	terraform validate .
# USE GITLAB ARTEFACT for deploy and destroy (terraform.tfstate)
infra_deploy:
	terraform init .
	terraform apply -auto-approve .
# Le job destroy doit-être mis en manuel
infra_destroy:
	terraform init .
	terraform destroy -auto-approve .
