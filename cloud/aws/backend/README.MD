# Terraform remote state

aws s3 ls

terraform init
terraform validate
terraform plan 
terraform apply 

Outputs:

dynamodb_table_name = 
s3_bucket_id = 



Add bakend S3

Uncomment

backend "s3" {

  bucket                    = "${var.name}-tf-remote-state-all-${var.aws_region}}"
  key                       = "aws/${var.name}/${var.aws_region}/${var.region}/${var.environment}/terraform.tfstate"
  region                    = "${var.region_bakend}"
  dynamodb_table            = "${var.name}-tf-remote-state-locks-all-${var.aws_region}}"
  encrypt                   = true 

}

terraform init

Initializing the backend...
Do you want to copy existing state to the new backend?
  Pre-existing state was found while migrating the previous "local" backend to the
  newly configured "s3" backend. No existing state was found in the newly
  configured "s3" backend. Do you want to copy this state to the new "s3"
  backend? Enter "yes" to copy and "no" to start with an empty state.

  Enter a value: yes
