# terraform
**A simple terraform template that illustarates the basic concepts necessary to create and access an EC2 instance.**
* AWS Provider
* Version Pinning
* Security Groups
* EC2 Instances
* AMI(s)
* SSH Keys
* Minimal .gitignore

**To generate the keys for this example run the following command, replacing the items in { brackets } accordingly.**
```$ ssh-keygen -t rsa -b 4096 -C "{myemail@address.com}" -f c:/{path to repo}/aws_ec2_example_key```

**To access the EC2 instance with ssh after running terraform apply run the following command, replacing the items in { brackets } accordingly. The { ip address } can be found in the terraform.tfstate file generated by running terraform apply.**
```$ ssh -i aws_ec2_example_key.pem ec2-user@{ip address}```