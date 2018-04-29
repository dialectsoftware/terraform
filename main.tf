terraform {
  required_version = "> 0.7.0"
}

provider "aws" {
  version = "~> 1.16"
  region  = "${var.aws_region}"
}

resource "aws_security_group" "example" {
  name = "example"

  tags {
    Name = "SSH"
  }

  description = "ONLY ssh CONNECTION INBOUND"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami                    = "${lookup(var.aws_amis, var.aws_region)}"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.example.id}"
  vpc_security_group_ids = ["${aws_security_group.example.id}"]
}

resource "aws_key_pair" "example" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}
