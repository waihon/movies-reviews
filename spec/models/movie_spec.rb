require 'rails_helper'

describe "A movie" do
  it "requires a title" do
    movie = Movie.new(title: "")

    movie.valid?  # populates errors

    expect(movie.errors[:title].any?).to eq(true)
  end

  it "requires a description" do
    movie = Movie.new(description: "")

    movie.valid?

    expect(movie.errors[:description].any?).to eq(true)
  end

  it "requires a released year" do
    movie = Movie.new(year: nil) 

    movie.valid?

    expect(movie.errors[:year].any?).to eq(true)
  end

  it "requires a director" do
    movie = Movie.new(director: "")

    movie.valid?

    expect(movie.errors[:director].any?).to eq(true)
  end
end