class Rafsi < ActiveRecord::Base

  self.table_name = "rafsi"

  attr_accessible :text

  belongs_to :word
end
