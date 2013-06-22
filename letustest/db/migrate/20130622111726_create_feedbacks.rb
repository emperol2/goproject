class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :url
      t.text :questions
      t.string :email
      t.string :numofbugs
      t.datetime :duedate
      t.string :firstname
      t.string :lastname
      t.string :telephone

      t.timestamps
    end
  end
end
