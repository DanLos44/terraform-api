
pipeline {

    agent none
    
      environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
    
    
       stage('Build') {
       
         agent {
           label 'docker'  	  
    	  }
    	  
          steps { 
             dir('/home/ubuntu/workspace/terraform/terraform-files')
             {    	
             sh 'terraform init -input=false -force-copy'
             sh 'terraform apply -target=archive_file.lambda_hello_world -auto-approve'
          }
       }
       }
       
      stage('Deploy') {
       
         agent {
           label 'chatbot2'  	  
    	  }
    	  
          steps { 
             dir('/home/ubuntu/workspace/terraform/terraform-files')
             {  
             sh 'terraform init -input=false -force-copy'
             sh 'terraform apply -target=aws_s3_bucket.lambda_bucket -target=random_pet.lambda_bucket_name -target=aws_s3_bucket_acl.bucket_acl -target=aws_s3_object.lambda_hello_world -auto-approve'
          }
       }
       }
       
       stage('Connect') {
       
         agent {
           label 'docker'  	  
    	  }
    	  
          steps { 
             dir('/home/ubuntu/workspace/terraform/terraform-files')
             {  
             sh 'terraform init -input=false -force-copy'
             
             sh 'terraform apply -target=aws_lambda_function.hello_world -target=aws_cloudwatch_log_group.hello_world -target=aws_iam_role.lambda_exec -target=aws_iam_role_policy_attachment.lambda_policy -auto-approve'
             
             sh 'terraform apply -target=aws_apigatewayv2_api.lambda -target=aws_apigatewayv2_stage.lambda -target=aws_apigatewayv2_integration.hello_world -target=aws_apigatewayv2_route.hello_world -target=aws_cloudwatch_log_group.api_gw -target=aws_lambda_permission.api_gw -auto-approve'
          }
       }
       }
             
       }              
 }



