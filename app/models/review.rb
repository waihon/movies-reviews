class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :stars, presence: true
  STARS = [1, 2, 3, 4, 5]
  validates :stars, inclusion: { in: STARS,
    message: "must be between 1 and 5" }

  validates :review, presence: true
end
