class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :author_id, null: false
      t.integer :subreddit_id, null: false
      t.string :title, null: false
      t.string :url, null: false
      t.timestamps
    end
  end
end
