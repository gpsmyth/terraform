## Format the code in present directory and sub-dirs
terrafrom fmt -recursive

## Get Providers
terraform init

## Check the modules
terraform validate

## plan - capture the module code
terraform plan

terraform apply --auto-approve
## Note outputs from above command

terraform state list

## Cleanup
terraform destroy



