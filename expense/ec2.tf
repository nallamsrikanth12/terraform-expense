resource "aws_instance" "expense" {
    count = length(var.instance_names)
    ami           =  var.image_id
    instance_type = var.instance_names[count.index] == "db" ? "t3.small" : "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_sg.id ]

  tags = merge(
      var.common_tags,
      {
        
        Name = var.instance_names[count.index]
        module = var.instance_names[count.index]
      }
  )
}


resource "aws_security_group" "allow_sg" {
  name        = var.sg_group
  description = "Allow TLS inbound traffic and all outbound traffic"
  
  egress {
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = var.protocal
    cidr_blocks      = var.cidr_blocks
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
   
  }
    tags = var.tags
}


