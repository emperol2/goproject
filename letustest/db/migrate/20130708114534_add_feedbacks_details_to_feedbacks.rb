class AddFeedbacksDetailsToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :name, :string
    add_column :feedbacks, :typeofbugs, :string
    add_column :feedbacks, :bugsystem, :string
    add_column :feedbacks, :numberoftesters, :string
    add_column :feedbacks, :version, :string
    add_column :feedbacks, :testinginstr, :text
    add_column :feedbacks, :status, :string
  end
end
