class AddForeignToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :tester_id, :integer
    add_column :projects, :user_id, :integer
  end
end
