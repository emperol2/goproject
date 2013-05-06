# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name
  
  #validates name and email (attributes)
  #the attribute declares as :XXX wherer XXX = name of attribute
  #the validation declares as XXX: where XXX = validation command 
  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true
end
