class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user, index: true, foreign_key: true
      # add polymorphic: true after generating model
      t.references :votable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
