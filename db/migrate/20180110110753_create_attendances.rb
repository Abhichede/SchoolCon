class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.string :date
      t.string :time
      t.integer :standard_id
      t.integer :division_id
      t.integer :teacher_id
      t.text :att_data

      t.timestamps
    end
  end
end
