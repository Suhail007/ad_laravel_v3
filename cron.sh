#!/bin/bash
# Make sure this file has executable permissions
# This block of code runs the Laravel scheduler every minute
while [ true ]
do
    echo "Running the scheduler..."
    php artisan schedule:run --verbose --no-interaction &
    sleep 60
done 