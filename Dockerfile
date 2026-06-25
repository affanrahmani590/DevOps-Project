# 1. Use the official Apache HTTP Server image
FROM httpd:latest

# 2. Set the working directory inside the container
WORKDIR /usr/local/apache2/htdocs/

# 3. Copy login, admin, and register page files into Apache web directory
COPY . /usr/local/apache2/htdocs/

# 4. Expose port 80 for web traffic
EXPOSE 80
