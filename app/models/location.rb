class Location < ApplicationRecord
  has_many :movie_locations, dependent: :destroy
  has_many :movies, through: :movie_locations
end
