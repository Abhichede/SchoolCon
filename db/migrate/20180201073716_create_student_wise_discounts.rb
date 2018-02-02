class CreateStudentWiseDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :student_wise_discounts do |t|
      t.integer :student_id
      t.string :description
      t.string :amount
      t.integer :academic_year_id
      t.boolean :is_payment_done

      t.timestamps
    end
  end
end
