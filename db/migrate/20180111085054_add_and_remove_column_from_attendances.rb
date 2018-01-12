class AddAndRemoveColumnFromAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :subject_id, :integer
    remove_column :attendances, :time
  end
end
