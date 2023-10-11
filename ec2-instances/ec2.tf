resource "aws_instance" "web" {
  ami = "ami-036f5574583e16426"
  instance_type = "t2.micro"

}