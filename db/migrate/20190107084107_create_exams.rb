class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.integer :academic_year_id
      t.string :name
      t.integer :standard_id
      t.integer :division_id

      t.timestamps
    end
  end
end
