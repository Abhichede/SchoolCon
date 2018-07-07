class AddColumnDivisionIdToHomework < ActiveRecord::Migration[5.1]
  def change
    add_column :homeworks, :division_id, :integer
    add_column :homeworks, :date, :date
  end
end
