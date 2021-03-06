class Gloss < ActiveRecord::Base
  attr_accessible :text, :tag, :language

  belongs_to :glossable, polymorphic: true
  belongs_to :language
  belongs_to :tag

  has_many :votes, as: :voteable
end
