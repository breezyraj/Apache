#!/bin/bash
echo "Logging into ECR..."
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 371320329671.dkr.ecr.us-east-1.amazonaws.com

echo "Pulling App 1..."
docker pull 371320329671.dkr.ecr.us-east-1.amazonaws.com/mohan-apache1-app1:latest

echo "Pulling App 2..."
docker pull 371320329671.dkr.ecr.us-east-1.amazonaws.com/mohan-apache1-app2:latest

echo "Running App 1 on port 8081..."
docker run -d -p 8081:80 --name app1 371320329671.dkr.ecr.us-east-1.amazonaws.com/mohan-apache1-app1:latest

echo "Running App 2 on port 8082..."
docker run -d -p 8082:80 --name app2 371320329671.dkr.ecr.us-east-1.amazonaws.com/mohan-apache1-app2:latest

echo "Containers running!"
docker ps
