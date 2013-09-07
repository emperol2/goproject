class AddNbofTestersToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :nboftester, :integer
  end
end
