class AddAttachmentToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :attachment_file_name, :string
    add_column :issues, :attachment_content_type, :string
    add_column :issues, :attachment_file_size, :integer
    add_column :issues, :attachment_updated_at, :datetime
  end
end
