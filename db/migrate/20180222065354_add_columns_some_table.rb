class AddColumnsSomeTable < ActiveRecord::Migration[5.1]
  def change
    add_column :standards, :desc, :text
    add_column :subjects, :desc, :text
    add_column :subjects, :code, :string

    remove_column :subjects, :standard_id

    create_join_table :subjects, :standards do |t|
      t.index [:subject_id, :standard_id]
      t.index [:standard_id, :subject_id]
    end

  end
end
