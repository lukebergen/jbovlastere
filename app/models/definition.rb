class Definition < ActiveRecord::Base
  attr_accessible :text

  belongs_to :user
  belongs_to :word
  belongs_to :language

  has_many :votes, as: :voteable
end
