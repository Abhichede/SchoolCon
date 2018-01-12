class CreateCasteCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :caste_categories do |t|
      t.string :category

      t.timestamps
    end
  end
end
