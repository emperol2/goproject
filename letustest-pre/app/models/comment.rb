class Comment < ActiveRecord::Base
  belongs_to :issue
  attr_accessible :description, :issue_id, :user_id, :tester_id

  validates :description, presence: true
end
