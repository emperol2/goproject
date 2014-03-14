class Feedback < ActiveRecord::Base
  belongs_to :user
  belongs_to :tester
  has_many :testers, :through => :assignments
  has_many :assignments
  #has_and_belongs_to_many :testers
  has_many :issues

  has_attached_file :attachment, :whiny => false,
                    :styles => {
                        :thumb => "75x75#",
                        :small => "100x100#",
                        :medium => "150x150>"
                    }

  attr_accessible :duedate, :email, :firstname, :lastname, :numofbugs, :questions, :telephone, :url, :name, :typeofbugs, :bugsystem, :numberoftesters,
  :version, :testinginstr, :status, :user_id, :avai_tester, :project_type, :attachment_content_type, :attachment_file_name, :attachment_file_size, :attachment_updated_at, :attachment_description, :attachment
  
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :name, presence: true

  self.per_page = 10
  
  def paypal_url(return_url)
    values = {
      :business => 'seller@letustest.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id
      }
      values.merge!({
        # test amount
      "amount_1" => 20.00, #amount
      "item_name_1" => 'test', #name of item
      "item_number_1" => 1, 
      "quantity_1" => '1'
      })
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end



end
