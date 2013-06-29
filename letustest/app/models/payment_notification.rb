class PaymentNotification < ActiveRecord::Base
  attr_accessible :feedback_id, :params, :status, :transaction_id
  belongs_to :feedback
  serialize :params
  after_create :mark_feedback_as_purchase
  
  private
  
  def make_feedback_as_purchase
    if status == "Completed"
        
    end
  end
end
