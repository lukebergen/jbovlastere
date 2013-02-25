require "minitest_helper"

describe Definition do
  before do
    @definition = Definition.new
  end

  it "must be valid" do
    @definition.valid?.must_equal true
  end
end
