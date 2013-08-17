class AddScoreToTesters < ActiveRecord::Migration
  def change
    add_column :testers, :score, :integer
  end
end
