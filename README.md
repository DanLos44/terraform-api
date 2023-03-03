This project is based on the following lambda function:
https://developer.hashicorp.com/terraform/tutorials/aws/lambda-api-gateway

-- General --
It implements a pipeline in Jenkins using 2 agents that on each run:
First agent creates & compiles the lambda function and packages it to a .zip folder artifact.
Second agent creates a s3 bucket and uploads the artifact using terraform.
First agent creates a AWS API Gateway to interact with this function.

-- How to build --
First of all make sure you have the folowing:
- A git repo integrated with jenkins(webhook)
- Terraform installed on both agents
- Both agents integrated with your aws credentials

After that just create a trigger to run the pipeline

-- How to interact --
The pipeline in the end will print you the link, which should look like this:
base_url = "https://<your api gateway link>/hello"

