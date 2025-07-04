#!/bin/bash
# Exit the script if any command fails
set -e

# Install dependencies
composer install --no-dev --optimize-autoloader

# Build assets using NPM
npm install
npm run build

# Clear cache
php artisan optimize:clear

# Cache the various components of the Laravel application
php artisan config:cache
php artisan event:cache
php artisan route:cache
php artisan view:cache

# Optimize Composer autoloader
composer dump-autoload --optimize 