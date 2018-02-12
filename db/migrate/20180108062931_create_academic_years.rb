class CreateAcademicYears < ActiveRecord::Migration[5.1]
  def change
    create_table :academic_years do |t|
      t.string :start_month
      t.string :start_year
      t.string :end_month
      t.string :end_year
      t.boolean :is_active

      t.timestamps
    end
  end
end
