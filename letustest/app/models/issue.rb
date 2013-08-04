class Issue < ActiveRecord::Base
  belongs_to :feedback
  attr_accessible :act_result, :description, :exp_result, :feedback_id, :priority, :title, :type, :feedback_id
