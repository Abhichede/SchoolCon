class ChangeColumnFromQuestion < ActiveRecord::Migration[5.1]
  def up
    rename_column :questions, :answer, :question_type
    change_column :questions, :question_type, :string
  end

  def down
    rename_column :questions, :question_type, :answer
  end
end
