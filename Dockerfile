FROM php:8.2-apache

# نصب افزونه‌های مورد نیاز
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# فعال‌سازی mod_rewrite
RUN a2enmod rewrite

# کپی فایل‌ها
COPY . /var/www/html/

# تنظیم مجوزها
WORKDIR /var/www/html/
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# پورت
EXPOSE 80

CMD ["apache2-foreground"]
