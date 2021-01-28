## About

This project was built on the bootcamp of onebicode.com. I built step by step with the classes taught by the course and customized it myself by improving some features and adding others.

This project is online, please visit to see \O/ => [rails-exchange](https://myrails-exchange.herokuapp.com/)

## Dependencies

I build this project use a linux Ubuntu 20.04 SO but i generate and run all dependencies in docker.

- Ruby 2.7.1
- rails 6.0.3
- bundler
- node 12+
- yarn 1.22.4
- postgresql

## Deployment

This project is deployed on Heroku with CI in Codeship.

## Local Configs

If you want to fork or clone this project to run in your machine, you will need to have a docker and docker-compose installed.

- run the `docker-compose build`
- run the `docker-compose run --rm app bundle`
- run the `docker-compose run --rm app yarn`
- run the `docker-compose run --rm app bundle exec rails db:migrate`
- run the `docker-compose up`

## Final words

Thank's for visit my github project =).
