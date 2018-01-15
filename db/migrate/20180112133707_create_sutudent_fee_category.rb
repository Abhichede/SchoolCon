class CreateSutudentFeeCategory < ActiveRecord::Migration[5.1]
  def change
    create_join_table :students, :fee_categories do |t|
      t.index [:student_id, :fee_category_id]
      t.index [:fee_category_id, :student_id]
    end
  end
end
