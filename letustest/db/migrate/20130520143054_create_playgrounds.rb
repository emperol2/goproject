class CreatePlaygrounds < ActiveRecord::Migration
  def change
    create_table :playgrounds do |t|
      t.string :name
      t.string :email
      t.string :url
      t.string :country
      t.text :title
      t.text :reproduce

      t.timestamps
    end
  end
end
