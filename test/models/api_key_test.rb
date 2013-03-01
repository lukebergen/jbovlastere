require "minitest_helper"

describe ApiKey do
  before do
    @api_key = ApiKey.new
  end

  it "must be valid" do
    @api_key.valid?.must_equal true
  end
end
