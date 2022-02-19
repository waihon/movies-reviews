# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

### Terminal Commands

* `rails g model Movie title description:text year:integer director`
* `rails g model Actor name`
* `rails g model MovieActor movie:references actor:references`
* `rails g model Location place country`
* `rails g model MovieLocation movie:references location:references`
* `rails g model User name`
* `rails g model Review stars:integer review:text movie:references user:references`