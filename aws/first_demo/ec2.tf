variable "env" {
  description = "enter the value for env"
}


resource "aws_instance" "myawsserver" {
  ami = "ami-0603cbe34fd08cb81"
  instance_type = "${var.env == "prod" ? "t3.micro" : "t3.nano"}"
  count = "${var.env == "prod" ? "2" : "1"}"

  tags = {
    Name = "Gagandeep-aws-ec2-instance-Nomura.${count.index}"
    Env = "test"
    Owner = "Gagandeep"
  }
}

output "myawsserver-ip" {
  value = aws_instance.myawsserver.public_ip
}

output "myserver-PrivateIP" {
  value = aws_instance.myawsserver.private_ip
}
