class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :hashed_password, null: false
      t.index :username, unique: true
      t.timestamps
    end
  end
end
