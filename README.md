# README

    1. About The Project
        ◦ Built With
    2. Getting Started
      ◦ Prerequisites
      ◦ Installation
	  ◦ Setup rswag gem
	  ◦ OMDb APIs
	  ◦ Devise Token Auth

    3. Usage
    4. Contact
# About The Project

A small cinema, which only plays movies from the Fast & Furious franchise,with cinema owners who can update the movie catalog. Customers can view movies time and can see details of their favorite movies. Customers can also leave rating for the movies.

### Built With
    • Ruby
    • Rails


# Getting Started

Follow the link to install rails:
https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm

### Prerequisites:

This is an example of how to list things you need to use the software and how to install them.
    • npm
      npm install npm@latest -g

### Installation

    1. Clone the repo
    2. git clone repo_link
    3. bundle install
    4. rake db:create
    5. rake db:migrate
### Document of swagger (rswag)

For generating document of swagger run following commands:

1) Generate the Swagger JSON file(s)
	rake rswag:specs:swaggerize
2) Spin up your app and check out the awesome, auto-generated docs at
	http://localhost:3000/api-docs

### OMDb APIs

When you fetch details about the movie, you'll want to use the Open Movie Database API, which is a RESTful web service to obtain movie information. A sample request to fetch the details for the first movie would look like:
http://www.omdbapi.com/?apikey=[yourkey]&i=tt0232500

##### Note: 

copy the env.example file to .env file in your project and replace the Key in .env key in MOVIE_API_KEY variable with your key.

# Usage
A small cinema, which only plays movies from the Fast & Furious franchise, with following functions:

1) An internal endpoint in which they (i.e. the cinema owners) can update show times and prices for their movie catalog
2) An endpoint in which their customers (i.e. moviegoers) can fetch movie times
3) An endpoint in which their customers (i.e. moviegoers) can fetch details about one of their movies (e.g. name, description, release date, rating, IMDb rating, and runtime). Even though there's a limited offering.
5) An endpoint in which their customers (i.e. moviegoers) can leave a review rating (from 1-5 stars) about a particular movie

# Contact
#### Your Name – Umair Raza

#### Project Link: https://movies-api-by-umair.herokuapp.com/

