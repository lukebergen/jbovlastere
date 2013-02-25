class Place < ActiveRecord::Base
  attr_accessible :position, :kind, :source_places

  belongs_to :word
  has_many :glosses, as: :glossable

  has_and_belongs_to_many :source_places,
                          class_name: "Place",
                          join_table: "source_places_used_by_places",
                          foreign_key: :used_by_place_id,
                          association_foreign_key: :source_place_id

  has_and_belongs_to_many :used_by_places, 
                          class_name: "Place",
                          join_table: "source_places_used_by_places",
                          foreign_key: :source_place_id,
                          association_foreign_key: :used_by_place_id

end
