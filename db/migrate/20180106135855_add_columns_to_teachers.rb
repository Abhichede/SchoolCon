class AddColumnsToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :dob, :string
    add_column :teachers, :gender, :string
    add_column :teachers, :blood_group, :string
    add_column :teachers, :email, :string
    add_column :teachers, :last_name, :string
    add_column :teachers, :address_two, :string
    add_column :teachers, :city, :string
    add_column :teachers, :state, :string
    add_column :teachers, :country, :string
    add_column :teachers, :pincode, :string
    add_column :teachers, :middle_name, :string
    add_column :teachers, :staff_type, :string

    rename_column :teachers, :name, :first_name
    rename_column :teachers, :address, :address_one

  end
end
