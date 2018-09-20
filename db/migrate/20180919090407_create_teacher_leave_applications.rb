class CreateTeacherLeaveApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_leave_applications do |t|
      t.integer :teacher_id
      t.string :subject
      t.text :message
      t.boolean :is_approved, default: false

      t.timestamps
    end
  end
end
