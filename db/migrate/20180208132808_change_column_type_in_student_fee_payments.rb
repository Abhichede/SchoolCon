class ChangeColumnTypeInStudentFeePayments < ActiveRecord::Migration[5.1]
  def change
    change_column :student_fee_payments, :amount, 'DOUBLE PRECISION USING CAST(amount AS DOUBLE PRECISION)' # :double  for mysql change it by commentiing qouted line
  end
end
