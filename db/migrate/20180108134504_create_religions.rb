class CreateReligions < ActiveRecord::Migration[5.1]
  def change
    create_table :religions do |t|
      t.string :name

      t.timestamps
    end
  end
end
