
# dev 

module "dev-app" {
    source = "./my_aws_infra"
    my_env = "dev"
    instance_type = "t2.micro"
    ami_id = "ami-0cb91c7de36eed2cb" 
    instance_count =1
}

#prd
module "prd-app" {
    source = "./my_aws_infra"
    my_env = "prd"
    instance_type = "t2.medium"
    ami_id = "ami-0cb91c7de36eed2cb" 
    instance_count =3
}

#stg
module "stg-app" {
    source = "./my_aws_infra"
    my_env = "stg"
    instance_type = "t2.small"
    ami_id = "ami-0cb91c7de36eed2cb" 
    instance_count =2
}
