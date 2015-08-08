class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id, null: false
      t.integer :subreddit_id, null: false
      t.index [:user_id, :subreddit_id], unique: true
      t.timestamps
    end
  end
end
