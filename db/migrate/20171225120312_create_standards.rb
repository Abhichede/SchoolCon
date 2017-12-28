class CreateStandards < ActiveRecord::Migration[5.1]
  def change
    create_table :standards do |t|
      t.string :name
      t.integer :no_of_divisions

      t.timestamps
    end
  end
end
