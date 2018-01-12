class CreateCastes < ActiveRecord::Migration[5.1]
  def change
    create_table :castes do |t|
      t.string :name

      t.timestamps
    end
  end
end
