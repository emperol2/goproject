class CreateTesters < ActiveRecord::Migration
  def change
    create_table :testers do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :gender
      t.string :phone
      t.string :city
      t.string :country
      t.string :twitterid
      t.string :linkedinid
      t.string :paypalid
      t.string :bankaccount
      t.text :aboutme

      t.timestamps
    end
  end
end
