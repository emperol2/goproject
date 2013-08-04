class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.string :priority
      t.text :description
      t.integer :tester_id

      t.timestamps
    end
  end
end
