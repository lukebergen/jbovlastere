class SourceWordsUsedByWords < ActiveRecord::Migration
  def up
    create_table :source_words_used_by_words, id: false do |t|
      t.integer :source_word_id, null: false
      t.integer :used_by_word_id, null: false
    end
    add_index(:source_words_used_by_words, [:source_word_id, :used_by_word_id], name: 'word_ids')
  end

  def down
    drop_table :source_words_used_by_words
    remove_index :source_words_used_by_words, name: 'word_ids'
  end
end
