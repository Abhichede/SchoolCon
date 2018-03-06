class CreateStudentCertificates < ActiveRecord::Migration[5.1]
  def change
    create_table :student_certificates do |t|
      t.integer :student_id
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
