resource "aws_vpc" "main" {
    cidr_block = var.cidr_block
    instance_tenancy = var.instance_tenancy
    enable_dns_support = var.enable_dns_support
    enable_dns_hostnames = var.enable_dns_hostnames
    tags = var.tags
}

#security group for   postgress RDS,5432

resource "aws_security_group" "allow_postgress" {
  name        = "allow_postgress"
  description = "Allow postgress inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "postgress from VPC"
    from_port        = var.postgress_port
    to_port          = var.postgress_port
    protocol         = "tcp"
    cidr_blocks      = var.cidr_list 
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags =  var.tags
}

# COUNT
# We have to create 3 EC2 instance
resource "aws_instance" "web_server" {
    count = 3
      ami = "ami-036f5574583e16426"
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_names[count.index]
  }
}

#functions
#EC2 Instanse : Attach public key to the server. you have private key in  you laptop
#then you will private key to login
#ssh-keygen -f terraform -->  terraform public and private key

# AWS key Terraform
resource "aws_key_pair" "terraformKey" {
  key_name   = "terraformKey"
  public_key = file("C:\\Users\\karunakara.pappala\\OneDrive - NTT\\Documents\\GitHub\\AWS-Terraform\\variables\\terraform.pub")
}

#CONDTION

resource "aws_instance" "Condition" {
  key_name = aws_key_pair.terraformKey.key_name
      ami = "ami-036f5574583e16426"
      instance_type = var.isProd ? "t3.large" : "t2.micro"
      tags={
          Name = "Condition-Server"
      } 
}



