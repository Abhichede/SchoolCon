class CreateParents < ActiveRecord::Migration[5.1]
  def change
    create_table :parents do |t|
      t.string :name
      t.string :mobile

      t.timestamps
    end
  end
end
