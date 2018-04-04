class AddDeletedAtToStudents < ActiveRecord::Migration[5.1]
  def change
    ## Students
    add_column :students, :deleted_at, :datetime
    add_index :students, :deleted_at

    # student wise fees
    add_column :student_wise_fees, :deleted_at, :datetime
    add_index :student_wise_fees, :deleted_at

    # student wise discounts
    add_column :student_wise_discounts, :deleted_at, :datetime
    add_index :student_wise_discounts, :deleted_at

    # Student fee payments
    add_column :student_fee_payments, :deleted_at, :datetime
    add_index :student_fee_payments, :deleted_at

    # Student wise fines
    add_column :student_wise_fines, :deleted_at, :datetime
    add_index :student_wise_fines, :deleted_at

    # Student wise instant fees
    add_column :student_wise_instant_fees, :deleted_at, :datetime
    add_index :student_wise_instant_fees, :deleted_at

    # Student certificates
    add_column :student_certificates, :deleted_at, :datetime
    add_index :student_certificates, :deleted_at

    # notifications
    add_column :notifications, :deleted_at, :datetime
    add_index :notifications, :deleted_at
  end
end
