#!/bin/bash
###Usage example
###./docker_import.sh my_aws_repo 12345678.dkr.ecr.us-east-1.amazonaws.com
set -e
###Your target AWS ECRegistry repository name
REPO_NAME=$1

###Your target AWS ECRegistry URL, i.e. 12345678.dkr.ecr.us-east-1.amazonaws.com
ECR_URL=$2

AWS_REGION=$(echo $ECR_URL | sed -e 's/.*.dkr.ecr.\(.*\).amazonaws.com.*/\1/')

if [ $# -ge 2 ]; then
    echo $0: usage: $0 REPO_NAME ECR_URL
    exit 1
fi
### add --profile at "aws ecr" command to use AWS credentials profile with permission to AWS ECR
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_URL
docker build -t "$REPO_NAME" .
docker tag "$REPO_NAME":latest "$ECR_URL"/"$REPO_NAME":latest
docker push "$ECR_URL"/"$REPO_NAME":latest
