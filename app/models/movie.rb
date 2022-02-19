class Movie < ApplicationRecord
  has_many :movie_actors, dependent: :destroy
  has_many :actors, through: :movie_actors
  has_many :movie_locations, dependent: :destroy
  has_many :locations, through: :movie_locations
  has_many :reviews

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :year, presence: true
  validates :director, presence: true
end
