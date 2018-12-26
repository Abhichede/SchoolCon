class CreateIssuedCertificates < ActiveRecord::Migration[5.1]
  def change
    create_table :issued_certificates do |t|
      t.integer :student_id
      t.string :reason
      t.string :cetrificate_name
      t.text :certificate_content
      t.integer :issued_by

      t.timestamps
    end
  end
end
