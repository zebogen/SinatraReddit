class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :voter, class_name: "User"
  validates :value, :votable_id, :votable_type, :voter_id, presence: :true
end
