class ChangeColumnTypeInStudentFeePayments < ActiveRecord::Migration[5.1]
  def change
    change_column :student_fee_payments, :amount, 'double USING CAST(amount AS double)'
  end
end
