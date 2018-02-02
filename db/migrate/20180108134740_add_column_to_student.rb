class AddColumnToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :joining_date, :string
    add_column :students, :roll_no, :string
    add_column :students, :student_adhar, :string
    add_column :students, :father_adhar, :string
    add_column :students, :mother_adhar, :string

    change_column :students, :religion, 'integer USING CAST(religion AS integer)'
    change_column :students, :caste, 'integer USING CAST(caste AS integer)'
    rename_column :students, :religion, :religion_id
    rename_column :students, :caste, :caste_id
  end
end
