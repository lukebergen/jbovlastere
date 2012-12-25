class AddVoteableSubjectToVote < ActiveRecord::Migration
  def change
    change_table :votes do |t|
      t.references :voteable, polymorphic: {default: 'definition'}
    end
  end
end
