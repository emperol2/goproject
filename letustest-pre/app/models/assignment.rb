class Assignment < ActiveRecord::Base
  belongs_to :tester
  belongs_to :feedback
  attr_accessible :feedback_id, :isfull, :tester_id
end
