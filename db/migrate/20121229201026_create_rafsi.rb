class CreateRafsi < ActiveRecord::Migration
  def change
    create_table :rafsi do |t|
      t.text :text
      t.timestamps
    end
  end
end
