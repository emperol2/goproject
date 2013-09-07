class AddAvaiTesterToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :avai_tester, :integer
  end
end
