@'
#!/bin/sh
set -eu

RESOLVER=${RESOLVER:-}
if [ -n "$RESOLVER" ]; then
    echo "Applying RESOLVER=$RESOLVER in /usr/local/nginx/conf/nginx.conf:"
    sed -i "s/^\(\s*\)#*\s*resolver .*/\1resolver $RESOLVER;/" /usr/local/nginx/conf/nginx.conf
    grep -n -E "^\s*resolver " /usr/local/nginx/conf/nginx.conf
fi

if [ $# -gt 0 ] && [ "${1#-}" != "$1" ]; then
    set -- nginx "$@"
fi

exec "$@"
'@
