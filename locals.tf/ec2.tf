resource "aws_instance" "web" {
  ami           =  "ami-090252cbe067a9e58"
  #instance_type = var.instance_names == "db" ? "t3.small" : "t3.micro"
  instance_type = local.ami_id
  vpc_security_group_ids = ["sg-007ba6b4f4350cbdf"]
  tags = local.tags
}