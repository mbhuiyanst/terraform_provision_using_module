resource "aws_instance" "testinstance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  count = var.instance_count
 
  
   tags = {
        Name = "${var.my_env}-my-demo-server"
    }
  
}