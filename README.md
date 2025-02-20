### <ins>Overview</ins>

[Viewing Party](https://github.com/khoifishpond/viewing_party) is a 10-day, 2 person project, during Mod 3 of 4 for Turing School's Back End Engineering Program.

Our challenge was to build a functioning web app consisting of multiple relational databases and pull from multiple API endpoints to create friendships that can make viewing parties associated with a movie.

Learning goals and areas of focus consisted of:

- Consume JSON APIs that require authentication 
- Build an application that requires basic authentication 
- Organize and refactor code to be more maintainable 
- Implement a self-referential relationship in ActiveRecord 
- Apply RuboCop’s style guide for code quality 
- Utilize Continuous Integration using Travis CI 
- Deploy to Heroku 

## Requirements
- Use RuboCop in project to enforce style guide
- Deploy to Heroku
- Use TravisCI for Continuous Integration
- Consume The Movie DB API
- Implement Basic Auth
- Choose one exploration option to complete

[Technical Requirements](https://github.com/turingschool-examples/viewing_party/projects/1)

### <ins>Tools Used</ins>
- Ruby 2.7.2
- Rails 5.2.6
- PostgresQL
- Postico
- Capybara
- Launchy
- Orderly
- SimpleCov
- Git/GitHub
- HTML
- CSS
- RSpec
- Pry
- Atom
- VS Code
- Heroku
- Faraday
- Travis
- RuboCop
- Figaro

### <ins>Contributors</ins>

👤  **Khoi Nguyen**
- Github: [Khoi Nguyen](https://github.com/khoifishpond)
- LinkedIn: [Khoi Nguyen](https://www.linkedin.com/in/khoifishpond)

👤  **Sami Peterson**
- Github: [Sami Peterson](https://github.com/sami-p)
- LinkedIn: [Sami Peterson](https://www.linkedin.com/in/samantha-peterson-15b18220b/)

# Viewing Party

This is the base repo for the [viewing party project](https://backend.turing.io/module3/projects/viewing_party) used for Turing's Backend Module 3.

### About this Project

Viewing party is an application in which users can explore movie options and create a viewing party event for the user and their friend's.

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`

## Versions

- Ruby 2.7.2

- Rails 5.2.5

Example wireframes to follow are found [here](https://backend.turing.io/module3/projects/viewing_party/wireframes)

## Background and Description

"For this project, you will be building an application to explore movies and create a viewing party event for you and your friends to watch a movie together. The application will require basic authentication."

## Setup

This project requires Ruby 2.7.2.

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

#### Project Configurations

* Ruby version
    ```bash
    $ ruby -v
    ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
    ```
    
* Consume API
  
   * visit [Movie DB API](https://developers.themoviedb.org/3/getting-started/introduction) to generate API key
   * Install 'Figaro' gem 
      ```
      bundle exec figaro install
      ```
   * Add API to Enviroment
  ```ruby 
   # config/application.yml  
   MOVIE_API: <<api_key>>
  ```
  * Interpolate API Key into endpoint calls
    *  *Example:
  ```ruby
     class MovieDbService < ApiService
     
        def self.top_movies_by_page(page)
          get_data("#{BASE_URL}/3/movie/top_rated?api_key=#{ENV["movie_db_api"]}&language=en-US&page=#{page}")[:results]
        end
     
     end 
  ```

* [System dependencies](https://github.com/bfl3tch/little-esty-shop/blob/main/Gemfile)
    ```bash
    $ rails -v
    Rails 5.2.6
    ```

* Database creation
    ```bash
    $ rails db:{drop,create,migrate}
    Created database 'viewing_party_development'
    Created database 'viewing_party_test'
    ```

* How to run the test suite
    ```bash
    $ bundle exec rspec -fd
    ```

* [Local Deployment](http://localhost:3000), for testing:
    ```bash
    $ rails s
    => Booting Puma
    => Rails 5.2.6 application starting in development
    => Run `rails server -h` for more startup options
    Puma starting in single mode...
    * Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
    * Min threads: 5, max threads: 5
    * Environment: development
    * Listening on tcp://localhost:3000
    Use Ctrl-C to stop

    ```

* [Heroku Deployment](https://viewing-party-and-chill.herokuapp.com/), for production
