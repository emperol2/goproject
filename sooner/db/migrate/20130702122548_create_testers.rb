class CreateTesters < ActiveRecord::Migration
  def self.up
    create_table :testers do |t|
      t.string :name
      t.string :email
      t.text :bio
      t.timestamps
    end
  end

  def self.down
    drop_table :testers
  end
end
