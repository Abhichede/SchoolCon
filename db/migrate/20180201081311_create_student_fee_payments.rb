class CreateStudentFeePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :student_fee_payments do |t|
      t.integer :student_id
      t.integer :academic_year_id
      t.date :payment_date
      t.string :payment_mode
      t.text :payment_desc
      t.double :amount

      t.timestamps
    end
  end
end
