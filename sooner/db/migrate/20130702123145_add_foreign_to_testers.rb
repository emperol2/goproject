class AddForeignToTesters < ActiveRecord::Migration
  def change
    add_column :testers, :project_id, :integer
  end
end
