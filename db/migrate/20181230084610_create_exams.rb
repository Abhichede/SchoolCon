class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.integer :exam_term_id
      t.string :exam_name

      t.timestamps
    end
  end
end
