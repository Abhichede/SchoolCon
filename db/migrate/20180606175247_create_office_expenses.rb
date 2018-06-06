class CreateOfficeExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :office_expenses do |t|
      t.string :particular
      t.text :description
      t.float :amount

      t.timestamps
    end
  end
end
