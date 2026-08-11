#!/bin/bash
echo "Logging into ECR..."
ECR_BASE="371320329671.dkr.ecr.us-east-1.amazonaws.com"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_BASE

# Start UI FIRST (proxy depends on it)
echo "Starting UI on port 3000..."
docker stop ui 2>/dev/null || true
docker rm ui 2>/dev/null || true
docker pull $ECR_BASE/my-app-ui:latest
docker run -d -p 3000:80 --name ui $ECR_BASE/my-app-ui:latest

# Start Backend SECOND (proxy depends on it)
echo "Starting Backend on port 8080..."
docker stop backend 2>/dev/null || true
docker rm backend 2>/dev/null || true
docker pull $ECR_BASE/my-app-backend:latest
docker run -d -p 8080:80 --name backend $ECR_BASE/my-app-backend:latest

#Start Proxy LAST (needs UI + Backend running first)
echo "Starting Proxy on port 80..."
docker stop proxy 2>/dev/null || true
docker rm proxy 2>/dev/null || true
docker pull $ECR_BASE/my-app-proxy:latest
docker run -d --network host --name proxy $ECR_BASE/my-app-proxy:latest

echo "Containers running!"
docker ps
