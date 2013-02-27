require "minitest_helper"

describe Definition do

  before do
    @word = Word.where(text: "djidirsku").first
    @definition = @word.definitions.first
  end

  it "must be valid" do
    @definition.valid?.must_equal true
  end

  describe ".parsed_definition" do

    it 'parses glossed places' do
      str = "x1=dj1=di1 (agent) wants to interupt x2=c1 (agent) from expressing x3=c2 (sedu'u/text/lu'e)"
      @definition.parsed_definition.must_equal(str)
    end
  end

  describe ".words_to_prefixes" do

    it 'builds a map of word to single letter' do
      words = ["abcd", "bcde", "cdef"]
      desired_result = {"abcd" => "a", "bcde" => "b", "cdef" => "c"}
      @definition.send(:words_to_prefixes, words).must_equal(desired_result)
    end
  end
end
