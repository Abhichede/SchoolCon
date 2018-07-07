class CreateLeaveApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :leave_applications do |t|
      t.string :subject
      t.text :message
      t.boolean :is_approved
      t.datetime :seen_date
      t.integer :teacher_id
      t.integer :student_id

      t.timestamps
    end
  end
end
