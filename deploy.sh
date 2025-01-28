#!/bin/bash
# Build and deploy the application

export COMPOSE_PROJECT_NAME=mycms

# Build images
docker-compose build

# Stop existing containers
docker-compose down

# Start new deployment
docker-compose up -d

# Run database migrations
docker-compose exec app php artisan migrate --force

# Clear caches
docker-compose exec app php artisan optimize:clear

echo "Deployment completed successfully!" 