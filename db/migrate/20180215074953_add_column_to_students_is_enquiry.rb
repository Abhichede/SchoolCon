class AddColumnToStudentsIsEnquiry < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :is_enquiry, :boolean, default: false
  end
end
