class AddColumnToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :academic_year_id, :integer
  end
end
