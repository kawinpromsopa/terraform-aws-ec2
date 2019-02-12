# terraform-aws-ec2
Provision EC2 (AWS) with Terraform

- [Terraform](https://www.terraform.io/downloads.html) version 0.11.7

# Deployment 
Create a workspace for separate Customer following: 

    export AWS_ACCESS_KEY_ID=...
    export AWS_SECRET_ACCESS_KEY=...
    source <Key_name>
    cd ./terraform-aws-ec2/
    terraform init
    terraform workspace new <customer>
    terraform workspace select <customer>

# Apply with shell script
    ./terraform-aws-ec2/terraform_apply <cusotmer>


# *Note: When you destroy instances with shell script "./terraform_destroy" or "terraform destroy" command, You must to delete state on aws s3 too


