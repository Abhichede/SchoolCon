class AddColumnToStudentMarks < ActiveRecord::Migration[5.1]
  def change
    add_column :student_marks, :exam_subject_id, :integer
  end
end
