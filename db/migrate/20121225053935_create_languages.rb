class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.text :code

      t.timestamps
    end
  end
end
