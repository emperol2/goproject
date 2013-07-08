class Link < ActiveRecord::Base
  attr_accessible :compatibility_ids, :project_id
  belongs_to :project
  belongs_to :compatibility
end
