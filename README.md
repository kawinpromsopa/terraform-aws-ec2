# terraform-aws-ec2
Provision EC2 (AWS) with Terraform

- [Terraform](https://www.terraform.io/downloads.html) version 0.11.7

# Deployment 
Create a workspace for separate Customers following: 

    export AWS_ACCESS_KEY_ID=...
    export AWS_SECRET_ACCESS_KEY=...
    source <Key_name>
    cd ./terraform-aws-ec2/
    terraform init
    terraform workspace new <customers>
    terraform workspace select <customers>
    terraform apply -var-file=customer_vars/<customer>.tfvar



