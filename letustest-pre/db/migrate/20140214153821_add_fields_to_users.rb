class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :aboutcompany, :text
    add_column :users, :website, :string
    add_column :users, :paypalaccount, :string
    add_column :users, :paymentinfo, :text
  end
end
