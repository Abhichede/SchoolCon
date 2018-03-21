class CreateMyTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :my_templates do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end
