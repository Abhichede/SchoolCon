class CreateTimeTableSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :time_table_settings do |t|
      t.time :school_start, default: '08:00:00'
      t.time :school_end, default: '18:00:00'
      t.integer :period_duration, default: 60
      t.integer :num_breaks, default: 3
      t.string :break_durations, default: '30, 60, 30'
      t.string :breaks_after, default: '11:00 AM, 01:30 PM, 04:30 PM'

      t.timestamps
    end
  end
end
