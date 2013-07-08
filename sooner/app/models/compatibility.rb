class Compatibility < ActiveRecord::Base
  attr_accessible :name, :compatibility_ids
  has_many :projects
end
