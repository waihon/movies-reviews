class Movie < ApplicationRecord
  has_many :movie_actors, dependent: :destroy
  has_many :actors through: :movie_actors
  has_many :movie_locations
  has_many :movie_locations, dependent: :destroy
  has_many :reviews
end
