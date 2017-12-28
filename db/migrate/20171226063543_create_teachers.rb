class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :name
      t.text :address
      t.string :contact
      t.string :subject_id
      t.string :standard_id
      t.string :division

      t.timestamps
    end
  end
end
