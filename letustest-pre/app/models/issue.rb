class Issue < ActiveRecord::Base
  has_many :comments
  belongs_to :feedback
  belongs_to :tester
  has_attached_file :attachment, :whiny => false,
                    :styles => {
                        :thumb => "75x75#",
                        :small => "100x100#",
                        :medium => "150x150>"
                    }
  attr_accessible :description, :priority, :tester_id, :title, :feedback_id, :approvalstatus, :issue_type, :attachment_content_type, :attachment_file_name, :attachment_file_size, :attachment_updated_at, :attachment, :issue_id, :id
  
end
