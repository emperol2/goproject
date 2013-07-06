class AddUserDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lastname, :string
    add_column :users, :contact_number, :string
    add_column :users, :company_name, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :company_type, :string
    add_column :users, :zipcode, :string
    add_column :users, :address, :string
    add_column :users, :state, :string
    add_column :users, :timezone, :string
  end
end
