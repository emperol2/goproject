class Tester < ActiveRecord::Base
  has_many :feedbacks
  has_many :issues
  attr_accessible :aboutme, :bankaccount, :city, :country, :email, :fname, :gender, :linkedinid, :lname, :paypalid, :phone, :twitterid, :password, :password_confirmation, :feedback_id

  has_secure_password
  
  #before_save { |user| user.email = email.downcase }
  
  #validates name and email (attributes)
  #the attribute declares as :XXX wherer XXX = name of attribute
  #the validation declares as XXX: where XXX = validation command 
  #validates :name, presence: true, length: { maximum: 10 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { maximum: 6 }, :on => :create
  validates :password_confirmation, presence: true, :on => :create
end
