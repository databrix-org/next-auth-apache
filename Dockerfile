# Use the official Node.js image as the base image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js app
RUN npm run build

# Install Apache
RUN apk add --no-cache apache2 apache2-utils

# Copy the built Next.js app to the Apache web root
RUN cp -r /app/.next /var/www/localhost/htdocs

# Configure Apache to serve the Next.js app
COPY apache-config.conf /etc/apache2/httpd.conf

# Expose port 80
EXPOSE 80

# Start Apache server
CMD ["httpd", "-D", "FOREGROUND"]
