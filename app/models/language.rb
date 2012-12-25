class Language < ActiveRecord::Base
  attr_accessible :code
  has_many :glosses
  has_many :definitions
end
