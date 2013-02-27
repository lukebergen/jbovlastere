class Word < ActiveRecord::Base
  attr_accessible :text, :notes, :valsi_type, :places, :user, :rafsi, :source_words

  has_and_belongs_to_many :source_words, 
                          class_name: "Word",
                          join_table: "source_words_used_by_words",
                          foreign_key: :used_by_word_id,
                          association_foreign_key: :source_word_id

  has_and_belongs_to_many :used_by_words, 
                          class_name: "Word",
                          join_table: "source_words_used_by_words",
                          foreign_key: :source_word_id,
                          association_foreign_key: :used_by_word_id
  
  has_many :definitions
  has_many :glosses, as: :glossable
  has_many :places
  has_many :rafsi

  belongs_to :user
end
