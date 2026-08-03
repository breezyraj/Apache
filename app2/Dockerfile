# Build stage
#FROM public.ecr.aws/docker/library/node:22-alpine AS builder
FROM httpd:2.4

# Copy custom HTML page
COPY index.html /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80