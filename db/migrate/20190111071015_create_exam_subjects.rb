class CreateExamSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_subjects do |t|
      t.integer :subject_id
      t.integer :exam_id
      t.float :max_marks
      t.float :pass_marks
      t.float :written_marks
      t.float :assessment_marks

      t.timestamps
    end
  end
end
