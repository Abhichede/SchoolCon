class CreateAcademicYears < ActiveRecord::Migration[5.1]
  def change
    create_table :academic_years do |t|
      t.string :academic_year
      t.string :start_date
      t.string :end_date
      t.string :current_year

      t.timestamps
    end
  end
end
