# Ruby RDF application

This application shows you data from RDF sites.

Enter a DOI code from www.dx.doi.org (ex: 147126.147133) and submit it to fetch datas from it. 

## Config

This application uses Docker, Ruby 2.4.4, Rails 5.2.50. 

The Gems used are rdf and linkeddata.

## Install

First of all, you must [install Docker](https://docs.docker.com/install/) on your machine.

Now, open your terminal , clone the repository and go into it.

Enter `docker-compose build` to generate the container. 

Then, enter `docker-compose up -d` to launch the container. 

Now you can go to `localhost:3030` to use the application. 

## Author

Made by Paul Girardin <paulgirardin@hotmail.fr> for the ECV Digital
