class ChangeColumnTypeFromAttendances < ActiveRecord::Migration[5.1]
  def up
    change_column :attendances, :date, "date USING date::date"
  end

  def down
    change_column :attendances, :date, :string
  end
end
