require "minitest_helper"

describe Vote do
  before do
    @vote = Vote.new
  end

  it "must be valid" do
    @vote.valid?.must_equal true
  end
end
