class RemoveColumnFromTeacher < ActiveRecord::Migration[5.1]
  def change
    remove_column :teachers, :subject_id, :integer
  end
end
