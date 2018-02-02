class CreateStudentWiseFees < ActiveRecord::Migration[5.1]
  def change
    create_table :student_wise_fees do |t|
      t.integer :student_id
      t.string :fee_category
      t.string :description
      t.string :amount
      t.integer :academic_year_id
      t.boolean :is_paid

      t.timestamps
    end
  end
end
