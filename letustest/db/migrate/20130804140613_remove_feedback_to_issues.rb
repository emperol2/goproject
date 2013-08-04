class RemoveFeedbackToIssues < ActiveRecord::Migration
  def up
    remove_column :issues, :feedback_id
  end

  def down
    add_column :issues, :feedback_id, :integer
  end
end
