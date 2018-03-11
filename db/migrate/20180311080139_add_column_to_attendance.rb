class AddColumnToAttendance < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :subject_id, :integer
  end
end
