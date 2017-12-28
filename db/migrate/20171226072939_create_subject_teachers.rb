class CreateSubjectTeachers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :subjects, :teachers do |t|
      t.index [:subject_id, :teacher_id]
      t.index [:teacher_id, :subject_id]
    end
  end
end
