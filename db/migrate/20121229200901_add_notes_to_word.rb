class AddNotesToWord < ActiveRecord::Migration
  def change
    change_table :words do |t|
      t.text :notes
    end
  end
end
