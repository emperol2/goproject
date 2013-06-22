class Feedback < ActiveRecord::Base
  attr_accessible :duedate, :email, :firstname, :lastname, :numofbugs, :questions, :telephone, :url
end
