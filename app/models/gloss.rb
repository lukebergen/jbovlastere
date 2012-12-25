class Gloss < ActiveRecord::Base
  attr_accessible :text

  belongs_to :glossable, polymorphic: true
  belongs_to :language
  belongs_to :tag
end
