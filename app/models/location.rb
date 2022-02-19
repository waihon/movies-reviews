class Location < ApplicationRecord
  has_many :movie_locations, dependent: :destroy
  has_many :movies, through: :movie_locations

  validates :place, presence: true
  validates :country, presence: true 
end
