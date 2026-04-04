#!/bin/bash

echo "Subindo GREEN..."

docker stop api-green || true
docker rm api-green || true

docker build -t minha-api:green .

docker run -d -p 8002:8000 --name api-green minha-api:green

echo "Green rodando na porta 8002"
