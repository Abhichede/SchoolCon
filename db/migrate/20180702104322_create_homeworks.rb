class CreateHomeworks < ActiveRecord::Migration[5.1]
  def change
    create_table :homeworks do |t|
      t.string :name
      t.text :description
      t.integer :standard_id
      t.string :attachment

      t.timestamps
    end
  end
end
