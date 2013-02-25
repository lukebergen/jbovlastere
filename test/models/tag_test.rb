require "minitest_helper"

describe Tag do
  before do
    @tag = Tag.new
  end

  it "must be valid" do
    @tag.valid?.must_equal true
  end
end
