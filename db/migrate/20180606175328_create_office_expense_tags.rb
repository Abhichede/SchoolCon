class CreateOfficeExpenseTags < ActiveRecord::Migration[5.1]
  def change
    create_table :office_expense_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
