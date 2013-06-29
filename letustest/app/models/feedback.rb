class Feedback < ActiveRecord::Base
  attr_accessible :duedate, :email, :firstname, :lastname, :numofbugs, :questions, :telephone, :url
  
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
