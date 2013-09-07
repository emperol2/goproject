class AddApprovalStatusToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :approvalstatus, :string
  end
end
