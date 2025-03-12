AWS Provisioning Using Terraform: Step-by-Step Guide
This repository contains Terraform code to provision AWS infrastructure for Production, Development, and Staging environments. The resources provisioned include EC2 instances, DynamoDB tables, and S3 buckets for each environment, utilizing reusable Terraform modules.

Prerequisites
Before you begin, make sure you have the following:

Terraform installed on your local machine. You can download it from here.
AWS CLI installed and configured. You can configure AWS CLI by running aws configure and entering your AWS access keys.
Git installed on your local machine to clone the repository.
Step 1: Clone the Repository
Clone the repository to your local machine using Git:


git clone https://github.com/mbhuiyanst/terraform_provision_using_module.git
cd terraform_provision_using_module

Step 2: Initialize Terraform
Navigate to the directory where your Terraform files are located and run the terraform init command to initialize the project. This will download the necessary provider plugins.


terraform init
Step 3: Configure the AWS Provider
In the main.tf or any Terraform file where you define your provider, you should have the following configuration:


provider "aws" {
  region = "us-east-1" # Change this to your preferred AWS region
}
Make sure your AWS credentials are set up either by using environment variables or by configuring the AWS CLI.

Step 4: Review the Modules
In the Terraform configuration, three modules are defined:

dev-app: Defines the development environment.
prd-app: Defines the production environment.
stg-app: Defines the staging environment.
Each module uses the following variables:

my_env: Defines the environment (e.g., "dev", "prd", "stg").
instance_type: Defines the type of EC2 instance (e.g., "t2.micro", "t2.medium").
ami_id: Specifies the AMI to be used for EC2 instances.
instance_count: Defines how many EC2 instances to launch.
Example of the module declaration:


module "dev-app" {
  source         = "./my_aws_infra"
  my_env         = "dev"
  instance_type  = "t2.micro"
  ami_id         = "ami-0cb91c7de36eed2cb"
  instance_count = 1
}

module "prd-app" {
  source         = "./my_aws_infra"
  my_env         = "prd"
  instance_type  = "t2.medium"
  ami_id         = "ami-0cb91c7de36eed2cb"
  instance_count = 3
}

module "stg-app" {
  source         = "./my_aws_infra"
  my_env         = "stg"
  instance_type  = "t2.small"
  ami_id         = "ami-0cb91c7de36eed2cb"
  instance_count = 2
}
Step 5: Configure Resources for Each Environment
The Terraform code for each environment will create the necessary AWS resources, such as:

EC2 Instances: Provisioned based on the instance_count and instance_type defined in each environment's module.
DynamoDB Tables: Each environment will have its own DynamoDB table.
S3 Buckets: Each environment will have its own unique S3 bucket for storage.
Example resource configuration for an S3 bucket:


resource "aws_s3_bucket" "riadbucket" {
  bucket = "${var.my_env}-test-my-app-bucket"
  tags = {
    Name = "${var.my_env}-test-my-app-bucket"
  }
}

Step 6: Run Terraform Plan
To preview the changes that Terraform will make to your AWS environment, run the following command:


terraform plan
This will show you the resources that will be created. Ensure that the number of resources is as expected for each environment.

Step 7: Apply the Terraform Configuration
Once you're satisfied with the plan, apply the changes to provision the resources:



terraform apply
Terraform will prompt you to confirm that you want to apply the changes. Type yes to proceed.

Step 8: Verify Resources in AWS
After Terraform finishes applying the changes, log in to your AWS Management Console and verify that the resources have been created:

EC2 instances in the specified availability zones.
DynamoDB tables named after the environment (e.g., dev-test-riad-table).
S3 buckets with names such as dev-test-my-app-bucket.
Step 9: Clean Up Resources
If you want to destroy the resources after testing, use the following command:


terraform destroy
This will remove all the resources that were created by Terraform.


Conclusion:
You’ve now successfully provisioned AWS infrastructure for Production, Development, and Staging environments using Terraform modules! You can extend this setup by adding more resources or updating the configuration as required.

If you encounter any issues or need further assistance, feel free to open an issue in this repository.

