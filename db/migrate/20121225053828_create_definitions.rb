class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.text :text
      t.belongs_to :user
      t.belongs_to :word
      t.belongs_to :language
      t.timestamps
    end
  end
end
