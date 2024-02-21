# busTicketsApp

## springboot backend

dependencies:
* web
* postgres
* jwt
* jpa
* dev tools
* logger
* lombok

Backend for a bus ticket sales application with authentication and roles.

## flutter frontend

dependedencies:
* http: ^1.1.0
* logger: ^2.0.2+1
* intl: ^0.19.0

## database Postgresql with docker
check the docker-compose.yml file into busTicket_back folder

docker-compose up --build   ---> Rebuild the images before starting the containers  
docker-compose up           ---> Starts container 
docker-compose down -v      ---> Stops and removes containers and associated volumes
docker-compose down         ---> Stops and removes containers, but preserves associated volumes