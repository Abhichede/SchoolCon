class AddColumnToTimeTableSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :time_table_settings, :breaks_after, :string, default: '11:00 AM, 01:30 PM, 04:30 PM'
  end
end
