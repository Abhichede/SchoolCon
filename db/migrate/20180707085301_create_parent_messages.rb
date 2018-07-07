class CreateParentMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :parent_messages do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.text :message

      t.timestamps
    end
  end
end
