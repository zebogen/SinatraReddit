class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  validates :author_id, :commentable_id, :commentable_type, :body, presence: true

  include Votable
  
end
