# Use the official Apache HTTP Server image from Docker Hub
FROM httpd:latest

# Set the default working directory inside the container
WORKDIR /usr/local/apache2/htdocs/

# Copy all project files from your local directory to the working directory
COPY . . 

# Document that the container listens on port 80 at runtime
EXPOSE 80
