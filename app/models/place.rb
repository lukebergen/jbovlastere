class Place < ActiveRecord::Base
  belongs_to :word
  has_many :glosses, as: :glossable
end
