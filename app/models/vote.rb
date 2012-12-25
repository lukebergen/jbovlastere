class Vote < ActiveRecord::Base
  attr_accessible :vote

  belongs_to :user
end
