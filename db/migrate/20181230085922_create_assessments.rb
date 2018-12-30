class CreateAssessments < ActiveRecord::Migration[5.1]
  def change
    create_table :assessments do |t|
      t.string :assessment_type
      t.integer :standard_id
      t.string :division_id
      t.string :integer
      t.string :assessment_name
      t.decimal :max_marks

      t.timestamps
    end
  end
end
