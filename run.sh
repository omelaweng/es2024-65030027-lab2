#!/bin/bash

# Start MongoDB container
docker run -d --name mongodbome -v ~/lab2/mongodb/init.js:/docker-entrypoint-initdb.d/init.js mongo

# Start Express container
docker build -t expressome ~/lab2/express
docker run -d --name expressome --link mongodb -p 3000:3000 expressome

# Start Nginx container
docker run -d --name nginxome -p 8080:80 -v ~/lab2/nginx/nginx.conf:/etc/nginx/nginx.conf -v ~/lab2/nginx/index.html:/usr/share/nginx/html/index.html nginx
