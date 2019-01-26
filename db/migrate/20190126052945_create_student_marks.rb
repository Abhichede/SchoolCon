class CreateStudentMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :student_marks do |t|
      t.integer :student_id
      t.integer :exam_id
      t.integer :subject_id
      t.float :marks

      t.timestamps
    end
  end
end
