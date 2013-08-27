class Issue < ActiveRecord::Base
  has_many :comments
  belongs_to :feedback
  belongs_to :tester
  attr_accessible :description, :priority, :tester_id, :title, :feedback_id, :approvalstatus
  
end
