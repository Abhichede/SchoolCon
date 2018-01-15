class CreateFeeCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :fee_categories do |t|
      t.string :name
      t.integer :standard_id
      t.string :amount

      t.timestamps
    end
  end
end
