class Project < ActiveRecord::Base
  belongs_to :user
  has_many :testers
  attr_accessible :name, :website, :description, :duedate
end
