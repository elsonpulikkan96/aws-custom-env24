Terraform Stack: aws-custom-vpc-ec2

This Terraform stack automates the provisioning of a Virtual Private Cloud (VPC) in AWS, including one public subnet and two private subnets. Launch ec2 instances and establish the foundational infrastructure for a typical production environment.

Prerequisites
Before you begin, ensure you have the following prerequisites:

AWS Account: You need an active AWS account to deploy the infrastructure.

IAM User: Create an IAM user with appropriate EC2 permissions and access tokens. Ensure that the user has the necessary permissions to create and manage resources.

Terraform Installation:

```sh
wget https://releases.hashicorp.com/terraform/1.8.3/terraform_1.8.3_linux_amd64.zip
```

```sh
unzip terraform_1.8.3_linux_amd64.zip
```
```sh
mv terraform /usr/local/bin/
```
Verify the installation:

```sh
which terraform
/usr/local/bin/terraform
```


Terraform Basics:

Ensure you have a good understanding of Terraform basics, including providers, variables, tf states, and tf commands.

Getting Started
Create a Project Directory:

```sh
mkdir devops_test
```
```sh
cd devops_test
```

Create a main.tf file and start Building:

Use the provided Terraform configuration in the main.tf file to define your infrastructure. Replace placeholder values, variables, and parameters as per your project requirements.

Terraform Commands

TF Version check
```sh
terraform --version
```

To initialize TF on the project Folder

```sh
terraform init
```
To reformat the TF code with the correct syntax

```sh
terraform fmt
```
To check the syntax and validity of your Terraform configuration:

```sh
terraform validate
```

To show the execution plan of existing TF code

```sh

terraform plan
```

To create the TF Stack

```sh
terraform apply --auto-approve
```

To destroy the TF Stack

```sh

terraform destroy
```

Notes:

Make sure to replace placeholder values, variables, and other parameters in the Terraform configuration based on your project requirements.

Refer to the official Terraform installation guide for the latest version.

Explore additional Terraform modules on the Terraform Registry.
Explore more features on Terraform Modules
