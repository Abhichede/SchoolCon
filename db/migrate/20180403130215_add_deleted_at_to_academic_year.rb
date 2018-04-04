class AddDeletedAtToAcademicYear < ActiveRecord::Migration[5.1]
  def change

    # Academic Year
    add_column :academic_years, :deleted_at, :datetime
    add_index :academic_years, :deleted_at

    ## Attendance
    add_column :attendances, :deleted_at, :datetime
    add_index :attendances, :deleted_at

    ## Divisions
    add_column :divisions, :deleted_at, :datetime
    add_index :divisions, :deleted_at

    ## Fee Categories
    add_column :fee_categories, :deleted_at, :datetime
    add_index :fee_categories, :deleted_at

    ## Standard
    add_column :standards, :deleted_at, :datetime
    add_index :standards, :deleted_at

    ## Time Table
    add_column :time_tables, :deleted_at, :datetime
    add_index :time_tables, :deleted_at

  end
end
