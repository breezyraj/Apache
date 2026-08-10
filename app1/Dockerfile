# Build stage
FROM public.ecr.aws/docker/library/httpd:2.4

RUN mkdir -p /usr/local/apache2/htdocs/app1
COPY index.html /usr/local/apache2/htdocs/index.html
# Copy custom HTML page
COPY index.html /usr/local/apache2/htdocs/app1/index.html

# Expose port 80
EXPOSE 80