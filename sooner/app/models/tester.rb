class Tester < ActiveRecord::Base
  belongs_to :project
  attr_accessible :name, :email, :bio, :project_id
end
