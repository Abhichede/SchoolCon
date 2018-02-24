class AddParentColumnToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :parent_id, :integer
  end
end
