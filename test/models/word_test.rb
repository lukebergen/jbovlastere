require "minitest_helper"

describe Word do
  before do
    @word = Word.new
  end

  it "must be valid" do
    @word.valid?.must_equal true
  end
end
