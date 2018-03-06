class AddLeavinCertColumnToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :leaving_certificate, :string
  end
end
