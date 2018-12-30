class CreateTotalMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :total_marks do |t|
      t.integer :exam_term_id
      t.integer :exam_id
      t.decimal :written_marks
      t.decimal :assessment_marks

      t.timestamps
    end
  end
end
