This project is based on the following lambda function:
https://developer.hashicorp.com/terraform/tutorials/aws/lambda-api-gateway

-- General --
It implements a pipeline in jenkins using 2 agents that on each run:
First agent creates & compiles the lambda function and packages it to a .zip folder artifact.
Second agent creates a s3 bucket and uploads the artifact using terraform.
First agent creates a AWS API Gateway to interact with this function.

-- How to build --
First of all make sure you have the folowing:
1) A git repo integrated with jenkins(webhook)
you can visit this site for more info:
https://www.blazemeter.com/blog/how-to-integrate-your-github-repository-to-your-jenkins-project

2)Install docker on both agents
you can visit this site for more info:
https://docs.docker.com/engine/install/ubuntu/

3)Install terraform on both agents
you can visit this file for more info:
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

-- How to run --

-If you want to run this project without a pipeline you can use the following commands:

terraform init
terraform apply

-If not, create a trigger like a push event to start the pipeline automatic


-- How to interact --
The pipeline in the end will print you the link, which should look like this:
base_url = "https://<your api gateway link>/hello"

-- How to delete --
Once you want to remove all the resources created with this project use:
terraform destroy

