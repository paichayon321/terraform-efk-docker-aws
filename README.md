# About

An example configuration demonstrating EFK via Docker Compose on AWS 

# Usage

# Terraform-SeleniumDocker-on AWS
Install terraform
```
wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
unzip terraform_0.12.24_linux_amd64.zip
```
# Create S3 bucket
```
name terraform-bucket-poc-3436

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::terraform-bucket-poc-3436"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject"],
      "Resource": "arn:aws:s3:::terraform-bucket-poc-3436/terraform-selenium.tfstate"
    }
  ]
}
```
# Test Run
```
# Export AWS Environment

export AWS_ACCESS_KEY_ID=<key>
export AWS_SECRET_ACCESS_KEY=<secret>
export AWS_DEFAULT_REGION=ap-southeast-1

# Run Terraform
./terraform init

If init error --> remove .terraform folder and run again

./terraform plan

./terraform apply 

./terraform apply -auto-approve

#UnApply
./terraform destroy
```
