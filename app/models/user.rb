class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :subreddits, through: :subscriptions
  has_many :posts, foreign_key: :author_id
  has_many :links, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :votes, foreign_key: :voter_id
  validates :username, :hashed_password, presence: true
  validates :username, uniqueness: true
end
