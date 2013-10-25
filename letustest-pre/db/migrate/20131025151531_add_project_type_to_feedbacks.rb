class AddProjectTypeToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :project_type, :string
  end
end
