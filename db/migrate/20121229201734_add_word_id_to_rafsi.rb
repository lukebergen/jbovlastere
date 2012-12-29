class AddWordIdToRafsi < ActiveRecord::Migration
  def change
    change_table :rafsi do |t|
      t.belongs_to :word
    end
  end
end
