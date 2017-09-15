# Fender auth

## Overview

This Rails 5 REST api provides a token based authentication system.

## Getting Started

1. Download and Install [Docker](https://www.docker.com)

2. Clone the repo

3. Build the image

```sh
  $ docker-compose build --force-rm
```

4. Install the Ruby gems

```sh
  $ docker-compose run --rm rails bundle install
```

5. Create, load, and seed the database

```sh
  $ docker-compose run --rm rails ./bin/rails db:create
  $ docker-compose run --rm rails ./bin/rails db:schema:load
  $ docker-compose run --rm rails ./bin/rails db:seed
```

6. Run it

```sh
  $ docker-compose up --remove-orphans
```

7. Test it

```sh
  $ docker-compose run --rm -e RAILS_ENV=test rails ./bin/rails db:seed
  $ docker-compose run --rm -e RAILS_ENV=test rails bash -c "./bin/rails db:environment:set RAILS_ENV=test && ./bin/rake db:test:prepare && ./bin/cucumber"
```
