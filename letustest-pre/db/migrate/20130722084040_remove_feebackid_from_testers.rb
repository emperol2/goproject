class RemoveFeebackidFromTesters < ActiveRecord::Migration
  def up
    remove_column :testers, :feedback_id
  end

  def down
    add_column :testers, :feedback_id, :string
  end
end
