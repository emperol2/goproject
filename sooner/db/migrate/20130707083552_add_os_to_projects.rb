class AddOsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :os, :string
  end
end
