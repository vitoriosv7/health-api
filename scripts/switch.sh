#!/bin/bash

NGINX_CONF=../nginx/nginx.conf

# Detecta qual está ativo
if grep -q "server host.docker.internal:8001;.*# Blue ativo" $NGINX_CONF; then
    echo "Trocando para GREEN..."
    sed -i 's/server host.docker.internal:8001;.*# Blue ativo/#server host.docker.internal:8001; # Blue\n        server host.docker.internal:8002; # Green ativo/' $NGINX_CONF
else
    echo "Trocando para BLUE..."
    sed -i 's/#server host.docker.internal:8001; # Blue\n        server host.docker.internal:8002; # Green ativo/server host.docker.internal:8001; # Blue ativo\n        #server host.docker.internal:8002; # Green/' $NGINX_CONF
fi

# Reinicia o container do Nginx
docker restart health-api-nginx
echo "Nginx atualizado!"
