resource "aws_s3_bucket" "riadbucket" {
    bucket = "${var.my_enviroment}-test-my-app-bucket-d"
    tags = {
            Name = "${var.my_enviroment}-test-my-app-bucket-d"
        }
}