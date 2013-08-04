class RemoveTypeFromIssues < ActiveRecord::Migration
  def up
    remove_column :issues, :type
  end

  def down
    add_column :issues, :type, :string
  end
end
