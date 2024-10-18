# Use a base image with PHP
FROM php:8.2-fpm-alpine

# Install Supervisor
RUN apk update && apk add --no-cache \
    supervisor \
    && mkdir -p /var/log/supervisor \
    && mkdir -p /etc/supervisor/conf.d

# Copy Supervisor configuration
COPY ./docker/supervisord/conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose the port for Supervisor (if you need to access it externally)
EXPOSE 8080

# Start Supervisor when the container starts
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]