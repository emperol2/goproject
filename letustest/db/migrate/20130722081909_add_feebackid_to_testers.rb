class AddFeebackidToTesters < ActiveRecord::Migration
  def change
    add_column :testers, :feedback_id, :string
  end
end
