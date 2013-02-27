require "minitest_helper"

describe Place do
  before do
    @place = Place.new
  end

  it "must be valid" do
    @place.valid?.must_equal true
  end

end
