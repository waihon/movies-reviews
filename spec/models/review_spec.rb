require 'rails_helper'

describe "A review" do
  it "requires a stars rating" do
    review = Review.new(stars: nil)

    review.valid?  # populates errors

    expect(review.errors[:stars].any?).to eq(true)
  end

  it "accepts star values of 1 through 5" do
    stars = [1, 2, 3, 4, 5]
    stars.each do |star|
      review = Review.new(stars: star)

      review.valid?

      expect(review.errors[:stars].any?).to eq(false)
    end
  end

  it "rejects invalid star values" do
    stars = [-1, 0, 6]
    stars.each do |star|
      review = Review.new(stars: star)

      review.valid?

      expect(review.errors[:stars].any?).to eq(true)
      expect(review.errors[:stars].first).to eq("must be between 1 and 5")
    end
  end

  it "requires a review" do
    review = Review.new(review: "")

    review.valid?

    expect(review.errors[:review].any?).to eq(true)
  end
end