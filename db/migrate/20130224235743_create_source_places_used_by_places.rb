class CreateSourcePlacesUsedByPlaces < ActiveRecord::Migration
  def up
    create_table :source_places_used_by_places, id: false do |t|
      t.integer :source_place_id, null: false
      t.integer :used_by_place_id, null: false
    end
    add_index(:source_places_used_by_places, [:source_place_id, :used_by_place_id], name: 'place_ids')
  end

  def down
    drop_table :source_places_used_by_places
    remove_index :source_places_used_by_places, name: 'place_ids'
  end
end
