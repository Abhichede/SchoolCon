class CreateExamTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_terms do |t|
      t.string :term_name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
