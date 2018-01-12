class RenameColumnFromStudents < ActiveRecord::Migration[5.1]
  def change
    rename_column :students, :category_id, :caste_category_id
  end
end
