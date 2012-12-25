class Definition < ActiveRecord::Base
  attr_accessible :text

  belongs_to :user
  belongs_to :word
  belongs_to :language
end
