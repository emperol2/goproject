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
  attr_accessible :email, :name, :password, :password_confirmation, :lastname, :contact_number, :company_name, :company_type
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  
  #validates name and email (attributes)
  #the attribute declares as :XXX wherer XXX = name of attribute
  #the validation declares as XXX: where XXX = validation command 
  validates :name, presence: true, length: { maximum: 10 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { maximum: 6 }, :on => :create
  validates :password_confirmation, presence: true, :on => :create
end
