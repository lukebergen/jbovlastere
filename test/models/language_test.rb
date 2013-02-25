require "minitest_helper"

describe Language do
  before do
    @language = Language.new
  end

  it "must be valid" do
    @language.valid?.must_equal true
  end
end
