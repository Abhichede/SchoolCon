class AddStudentIdToUsers < ActiveRecord::Migration[5.1]
  def self.up
    add_column :users, :student_id, :integer
  end

  def self.down
    remove_column :users, :student_id
  end
end
