class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :subreddit
  validates :user_id, :subreddit_id, presence: true
  validates_uniqueness_of :user_id, scope: :subreddit_id
end
