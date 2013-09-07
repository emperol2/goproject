class AddNewNameToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_name, :string
    add_column :comments, :tester_name, :string
  end
end
