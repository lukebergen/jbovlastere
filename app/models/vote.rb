class Vote < ActiveRecord::Base
  attr_accessible :vote

  belongs_to :user
  belongs_to :voteable, polymorphic: true
end
