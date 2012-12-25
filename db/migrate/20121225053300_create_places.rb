class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.belongs_to :word
      t.timestamps
    end
  end
end
