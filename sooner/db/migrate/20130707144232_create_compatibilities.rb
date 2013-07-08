class CreateCompatibilities < ActiveRecord::Migration
  def change
    create_table :compatibilities do |t|
      t.string :name

      t.timestamps
    end
  end
end
