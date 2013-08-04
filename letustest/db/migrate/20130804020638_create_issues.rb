class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.string :type
      t.string :priority
      t.text :description
      t.text :exp_result
      t.text :act_result
      t.string :feedback_id

      t.timestamps
    end
  end
end
