variable "my_env" {
    description = "The environment for the app"
    type = string
}

variable "instance_type" {
    description = "value of the instance type"
    type = string
}

variable "ami_id" {
    description = "value of the ami"
    type = string
}

variable "instance_count" {
    description = "Number of Instance"
    type = number
  
}
variable "aws_region" {
  description = "AWS region where resources will be provisioned"
  default     = "us-east-2"
}