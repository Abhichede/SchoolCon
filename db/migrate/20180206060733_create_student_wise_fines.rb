class CreateStudentWiseFines < ActiveRecord::Migration[5.1]
  def change
    create_table :student_wise_fines do |t|
      t.integer :student_id
      t.integer :academic_year_id
      t.text :desciption
      t.string :amount

      t.timestamps
    end
  end
end
