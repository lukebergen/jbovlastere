class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :text
      t.belongs_to :user
      t.timestamps
    end
  end
end
