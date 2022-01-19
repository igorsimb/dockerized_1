# Production ready dockerized app

Includes static files

## Usage
 1. Download the repo
 2. Make sure you have [Docker](https://www.docker.com/get-started) installed
 3. Go to the docker-project1 folder:
```cd docker-project1```

For Development environment (localhost:8000) run
```
docker-compose up
```

For Production environment (localhost:8080) run
```
docker-compose -f docker-compose-deploy.yml up --build
```