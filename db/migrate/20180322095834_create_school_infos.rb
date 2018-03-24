class CreateSchoolInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :school_infos do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.string :registration_no
      t.string :gst_no
      t.string :email
      t.string :code
      t.string :logo

      t.timestamps
    end
  end
end
