class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author_id, null: false
      t.integer :subreddit_id, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.timestamps
    end
  end
end
