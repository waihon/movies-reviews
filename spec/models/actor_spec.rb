require 'rails_helper'

describe "An actor" do
  it "requires a name" do
    actor = Actor.new(name: "")

    actor.valid?  # populates errors

    expect(actor.errors[:name].any?).to eq(true)
  end
end