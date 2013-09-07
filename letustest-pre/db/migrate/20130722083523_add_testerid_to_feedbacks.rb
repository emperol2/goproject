class AddTesteridToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :tester_id, :string
  end
end
