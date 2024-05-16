
variable "instance_names" {
    type = list(string)
    default = [ "db" , "backend" , "frontend"]
}
variable "image_id" {
    type = string
    default = "ami-090252cbe067a9e58"
}

variable "instance_type" {

    type = string
    default = "t3.micro"
}


variable "common_tags" {
    type = map(string)
    default = {
        enviroment = "dev"
        project = "expense"
        date = "16-05-2024"
        terraform = "true"
    }
}


variable "sg_group" {

    type =  string
    default = "allow_sg"
}

variable "ssh_port" {

    type = number
    default = 22
}

variable "protocal" {

    type = string
    default = "tcp"
}


variable "cidr_blocks" {

    type = list(string)

    default = ["0.0.0.0/0"]
}

variable "tags" {
    type = map(string)
    default = {
        Name = "allow_sg"
        created = "srikanth"
        date = "16-05-2024"
        terraform = "true"
    }

}