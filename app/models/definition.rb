class Definition < ActiveRecord::Base
  attr_accessible :text, :user, :word, :language

  belongs_to :user
  belongs_to :word
  belongs_to :language

  has_many :votes, as: :voteable

  def parsed_definition
    result_str = self.text
    place_strings = place_strings()
    place_strings.each_with_index do |str, i|
      result_str.gsub!("{#{i+1}}", str)
    end
    result_str
  end

  private
    def place_strings
      source_words = self.word.source_words.map(&:text).uniq
      prefixes = words_to_prefixes(source_words)
      self.word.places.map do |place|
        place_str = place.source_places.map do |source_place|
          "#{prefixes[source_place.word.text]}#{(source_place.position + 1)}"
        end
        result = (["x#{place.position + 1}"] + place_str).join('=')
        result << " (#{place.kind})" unless place.kind.blank?
        result
      end
    end

    def words_to_prefixes(source_words)
      long_to_short = source_words.each_with_object({}) {|word, hash| hash[word] = word[0]}
      n = 1
      begin
        dupes = Hash[*long_to_short.group_by {|k,v| v}.select {|k,v| v.count > 1}.values]
        dupes.each {|k, v| long_to_short[k] = k[0..n]}
        n += 1
      end while dupes != {}
      long_to_short
    end

end
