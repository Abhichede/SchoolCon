class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.string :date
      t.integer :standard_id
      t.integer :division_id
      t.integer :teacher_id
      t.json :att_data
      t.integer :student_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
