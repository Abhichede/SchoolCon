class CreateTimeTables < ActiveRecord::Migration[5.1]
  def change
    create_table :time_tables do |t|
      t.integer :standard_id
      t.string :division
      t.string :day
      t.time :start_time
      t.time :end_time
      t.integer :teacher_id
      t.string :subject

      t.timestamps
    end
  end
end
