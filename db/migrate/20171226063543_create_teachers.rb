class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.text :address_one
      t.string :contact
      t.string :subject_id
      t.string :standard_id

      t.string :dob
      t.string :gender
      t.string :blood_group
      t.string :email
      t.string :last_name
      t.string :address_two
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.string :middle_name
      t.string :staff_type


      t.timestamps
    end
  end
end
