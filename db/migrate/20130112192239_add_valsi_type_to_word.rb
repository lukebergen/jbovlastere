class AddValsiTypeToWord < ActiveRecord::Migration
  def change
    change_table :words do |t|
      t.text :valsi_type
    end
  end
end
