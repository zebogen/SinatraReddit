class Subreddit < ActiveRecord::Base
  has_many :links
  has_many :posts
  validates :name, { presence: true, uniqueness: true }
end
