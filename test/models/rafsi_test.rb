require "minitest_helper"

describe Rafsi do
  before do
    @rafsi = Rafsi.new
  end

  it "must be valid" do
    @rafsi.valid?.must_equal true
  end
end
