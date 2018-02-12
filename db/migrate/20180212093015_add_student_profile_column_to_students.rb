class AddStudentProfileColumnToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :profile_photo, :string
  end
end
