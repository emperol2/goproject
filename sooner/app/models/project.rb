class Project < ActiveRecord::Base
  belongs_to :user
  has_many :testers
  attr_accessible :name, :website, :description, :duedate, :compatibility_ids
  has_many :links
  has_many :compatibilities, :through => :links
end
