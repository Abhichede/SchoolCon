class CreateClassTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :class_teachers do |t|
      t.integer :division_id
      t.integer :teacher_id
      t.integer :standard_id

      t.timestamps
    end
  end
end
