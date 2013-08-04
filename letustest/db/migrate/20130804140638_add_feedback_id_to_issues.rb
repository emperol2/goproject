class AddFeedbackIdToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :feedback_id, :integer
  end
end
