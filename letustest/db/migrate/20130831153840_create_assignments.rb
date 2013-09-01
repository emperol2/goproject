class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :feedback_id
      t.integer :tester_id
      t.string :isfull

      t.timestamps
    end
  end
end
