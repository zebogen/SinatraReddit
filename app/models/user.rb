class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :subreddits, through: :subscriptions
  has_many :posts, foreign_key: :author_id
  has_many :links, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :votes, foreign_key: :voter_id
  validates :username, :hashed_password, presence: true
  validates :username, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(params)
    @user = self.find_by(email: params[:email])
    @user if @user.password == params[:password]
  end
end
