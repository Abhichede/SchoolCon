class RemoveColumnFromTeachers < ActiveRecord::Migration[5.1]
  def change
    remove_column :teachers, :division, :string
  end
end
