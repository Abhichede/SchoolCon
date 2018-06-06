class AddDateToOfficeExpenses < ActiveRecord::Migration[5.1]
  def change
    add_column :office_expenses, :date, :date
  end
end
