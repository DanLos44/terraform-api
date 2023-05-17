Terraform-AWS Lambda pipeline project 
==========================

General
------------
This project is based on the following lambda function:
https://developer.hashicorp.com/terraform/tutorials/aws/lambda-api-gateway

It implements a pipeline in jenkins using 2 agents that on each run:
First agent creates & compiles the lambda function and packages it to a .zip folder artifact.
Second agent creates a s3 bucket and uploads the artifact using terraform.
First agent creates a AWS API Gateway to interact with this function.

How to build
------------
First of all make sure you have the folowing:
1) A git repo integrated with jenkins(webhook)

2)Install docker on both agents
- you can visit this site for more info: https://docs.docker.com/engine/install/ubuntu/

3)Install terraform on both ag-ents
- sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
- wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
- echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
- sudo apt update
- sudo apt-get install terraform


How to run
------------
-If you want to run this project without a pipeline you can use the following commands:

terraform init
terraform apply

-If not, create a trigger like a push event to start the pipeline automatic


How to interact
------------
The pipeline in the end will print you the link, which should look like this:
base_url = "https://(your api gateway link)/hello"

How to delete
------------
Once you want to remove all the resources created with this project use:
terraform destroy

