class AddPositionToPlaces < ActiveRecord::Migration
  def change
    change_table :places do |t|
      t.integer :position
    end
  end
end
