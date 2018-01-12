class RenameColumnFromStandard < ActiveRecord::Migration[5.1]

  def change
    remove_column :standards, :no_of_divisions
  end
end
