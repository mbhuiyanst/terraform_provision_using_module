resource "aws_s3_bucket" "riadbucket" {
    bucket = "${var.my_env}-test-my-app-bucket"
    tags = {
            Name = "${var.my_env}-test-my-app-bucket"
        }
}