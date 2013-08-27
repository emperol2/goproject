class AddNewFieldsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :issue_id, :integer
    add_column :comments, :user_id, :integer
    add_column :comments, :tester_id, :integer
  end
end
