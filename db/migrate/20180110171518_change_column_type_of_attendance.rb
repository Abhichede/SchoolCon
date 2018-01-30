class ChangeColumnTypeOfAttendance < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :att_data, 'json USING CAST(att_data AS json)'
  end
end
