# Use the official PHP base image with Apache
FROM php:7.4-apache

# Install required PHP extensions and Apache
RUN apt-get update \
    && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the PHP application files to the container's working directory
COPY content /var/www/html/content
COPY template /var/www/html/template
COPY config.php /var/www/html
COPY index.php /var/www/html
COPY function.php /var/www/html

# Expose the port on which Apache will listen (replace 80 with your desired port)
EXPOSE 80

# Start Apache web server to serve the PHP application
CMD ["apache2-foreground"]
