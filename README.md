# Fender auth
____
## Overview

This Rails 5 REST api provides a token based authentication system.
____
## Getting Started

1/ Download and Install [Docker](https://www.docker.com)

2/ Clone the repo

3/ Build the image

```sh
  $ docker-compose build --force-rm
```

4/ Install the Ruby gems

```sh
  $ docker-compose run --rm rails bundle install
```

5/ Create, load, and seed the database

```sh
  $ docker-compose run --rm rails ./bin/rails db:create
  $ docker-compose run --rm rails ./bin/rails db:schema:load
  $ docker-compose run --rm rails ./bin/rails db:seed
```

6/ Run it

```sh
  $ docker-compose up --remove-orphans
```

7/ Test it

```sh
  $ docker-compose run --rm -e RAILS_ENV=test rails ./bin/rails db:seed
  $ docker-compose run --rm -e RAILS_ENV=test rails ./bin/cucumber
```
____
## Containerization

  The entire project runs on Docker.  
  Two data volumes are created when starting the application.  
  One for Postgres data and the other one for caching the gems.  
  The versions used are Rails 5.1.4, Ruby 2.4.1, Postgres 9.6  
____
## Testing

  9 scenarii are currently in place to test all endpoints and use cases.
____
## Mechanism

  This Rails 5 app relies on JWT token for token signature, expiration and a payload.  
  A working workflow would be  
  1. create a user  
  2. log user in (request token)  
  3. request resource using token  
____
## Endpoints

  There are 5 endpoints
```
Prefix Verb   URI Pattern  Controller#Action Description
 users POST   /users       users#create      User registration
  user PUT    /users/:id   users#update      Update user
       DELETE /users/:id   users#destroy     Delete user
 login POST   /auth/login  auth#create       Log user in
logout DELETE /auth/logout auth#destroy      Log user out
```
____
## Enhancements

  Documentation  
  Password complexity  
  Make it a Rails engine so the authentication system can be reused  
  Add unit and integration tests (currently end to end only)  
  Plug a frontend client and test CORS  
  Expire token  
  Continuous Integration with Circle CI 2.0  
  Code refactor - add a authentication in a service  
  Add endpoint to log in using facial recognition  
  Code coverage report  
