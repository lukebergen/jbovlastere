class AddKindToPlaces < ActiveRecord::Migration
  def change
    change_table :places do |t|
      t.string :kind
    end
  end
end
