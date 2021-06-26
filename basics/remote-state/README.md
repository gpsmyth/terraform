# README

## Pre-req

Pre-requisites for following along:
  1. Docker should be pre-installed and accessible via default Terraform docker provider mechanism
  2. Terraform binary version should be greater than or equal to 0.13.
  3. AWS CLI should be installed.
  
## S3

### Be sure to create an S3 bucket and plug in its name into the bucket field in the backend.tf file
```
aws --profile  [profile name] s3api create-bucket --bucket ps-networks-svc-terraform 
{
    "Location": "/ps-networks-svc-terraform"
}
```
### Download state from remote bucket
```
aws s3 cp s3://ps-networks-svc-terraform/cloud-networks/kreuzwerker/docker/terraform.tfstate .
download: s3://ps-networks-svc-terraform/cloud-networks/kreuzwerker/docker/terraform.tfstate to ./terraform.tfstate
```

### Attempt tf apply using a different port
```
terraform apply -var external_port=8181
Error: Invalid value for variable
  on variables.tf line 1:
   1: variable "external_port" {
Port values can only be 8080 or 80.
This was checked by the validation rule at variables.tf:4,3-13.
```

### tf state
```
terraform state list
docker_container.nginx
docker_image.nginx-image
```