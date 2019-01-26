class CreateExamMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_marks do |t|
      t.integer :student_id
      t.integer :exam_id
      t.integer :exam_subject_id
      t.float :written_marks
      t.float :assessment_marks

      t.timestamps
    end
  end
end
