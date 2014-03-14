class AddAttachmentToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :attachment_file_name, :string
    add_column :feedbacks, :attachment_content_type, :string
    add_column :feedbacks, :attachment_file_size, :integer
    add_column :feedbacks, :attachment_updated_at, :datetime
    add_column :feedbacks, :attachment_description, :text
  end
end
