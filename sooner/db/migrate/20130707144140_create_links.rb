class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :project_id
      t.integer :compatibility_id

      t.timestamps
    end
  end
end
