class ChangeColumnTypeOfAttendance < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :att_data, :json
  end
end
