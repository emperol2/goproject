class Issue < ActiveRecord::Base
  belongs_to :feedback
  belongs_to :tester
  attr_accessible :description, :priority, :tester_id, :title, :feedback_id, :approvalstatus
  
end
