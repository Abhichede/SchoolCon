class CreateJoinTableStudentsAcademicYears < ActiveRecord::Migration[5.1]
  create_table :academic_years_students do |t|
    t.belongs_to :academic_year, index: true
    t.belongs_to :student, index: true
  end
end
