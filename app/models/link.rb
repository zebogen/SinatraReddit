class Link < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :author, class_name: "User"
  belongs_to :subreddit
  validates :title, :url, presence: true

  include Votable
  include Commentable
end
