class CreateJoinTableStudentsStandards < ActiveRecord::Migration[5.1]
  create_table :standards_students do |t|
    t.belongs_to :standard, index: true
    t.belongs_to :student, index: true
  end

  create_table :divisions_students do |t|
    t.belongs_to :division, index: true
    t.belongs_to :student, index: true
  end
end
