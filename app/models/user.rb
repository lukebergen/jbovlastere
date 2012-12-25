class User < ActiveRecord::Base
  attr_accessible :email, :name
  have_many :words
  have_many :definitions
  have_many :votes
end
