require 'rails_helper'

describe "A location" do
  it "requires a place" do
    location = Location.new(place: "")

    location.valid?  # populates errors

    expect(location.errors[:place].any?).to eq(true)
  end

  it "requires a country" do
    location = Location.new(country: "")

    location.valid?

    expect(location.errors[:country].any?).to eq(true)
  end
end