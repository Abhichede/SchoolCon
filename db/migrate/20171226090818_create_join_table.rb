class CreateJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :standards, :teachers do |t|
      t.index [:standard_id, :teacher_id]
      t.index [:teacher_id, :standard_id]
    end
  end
end
