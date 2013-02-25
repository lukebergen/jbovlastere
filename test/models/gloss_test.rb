require "minitest_helper"

describe Gloss do
  before do
    @gloss = Gloss.new
  end

  it "must be valid" do
    @gloss.valid?.must_equal true
  end
end
