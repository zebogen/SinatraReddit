class Post < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :author, class_name: "User"
  belongs_to :subreddit
  validates :author_id, :subreddit_id, :title, :body, presence: true

  include Votable

end
