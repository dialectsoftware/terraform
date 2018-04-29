variable "public_key_path" {
  description = <<DESCRIPTION
    Path to the SSH public key to be used for authentication.
    Ensure this keypair is added to your local SSH agent so provisioners can
    connect.
    Example: ~/.ssh/terraform.pub
  DESCRIPTION

  default = "aws_ec2_example_key.pub"
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  default     = "example_tier_key"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-1"
}

variable "aws_amis" {
  default = {
    us-east-1 = "ami-467ca739" #"ami-1853ac65"
  }
}
