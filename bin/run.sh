#!/bin/sh

if [ ! -f /postfixadmin/config.local.php ]; then
    echo "config.local.php not found!"
    exit 1
fi

# Create smarty cache folder
mkdir -p /postfixadmin/templates_c

# Set permissions
chown -R $UID:$GID /postfixadmin

# RUN !
exec su-exec $UID:$GID php7 -S 0.0.0.0:8888 -t /postfixadmin/public
