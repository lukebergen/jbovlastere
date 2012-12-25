class CreateGlosses < ActiveRecord::Migration
  def change
    create_table :glosses do |t|
      t.text :text
      t.references :glossable, polymorphic: {default: 'word'}
      t.belongs_to :language
      t.belongs_to :tag
      t.timestamps
    end
  end
end
