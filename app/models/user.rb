class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :words
  has_many :definitions
  has_many :votes
end
