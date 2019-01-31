class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :standard_id
      t.integer :division_id
      t.integer :subject_id
      t.integer :teacher_id
      t.text :question
      t.text :answer
      t.float :marks

      t.timestamps
    end
  end
end
