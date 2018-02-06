class CreateStudentWiseInstantFees < ActiveRecord::Migration[5.1]
  def change
    create_table :student_wise_instant_fees do |t|
      t.integer :student_id
      t.integer :academic_year_id
      t.text :description
      t.string :amount

      t.timestamps
    end
  end
end
