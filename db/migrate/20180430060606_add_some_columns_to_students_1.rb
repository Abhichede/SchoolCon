class AddSomeColumnsToStudents1 < ActiveRecord::Migration[5.1]
  def up
    add_column :students, :medical_history, :string, default: 'NA'
    add_column :students, :skill_of_child, :string, default: 'NA'
    add_column :students, :siblings_schooling_details, :text
    add_column :students, :is_transportation_required, :boolean, default: false
    add_column :students, :transport_pickup_point, :string, default: ''
    add_column :students, :disability_of_student, :string, default: 'NA'
  end

  def down
    remove_column :students, :medical_history
    remove_column :students, :skill_of_child
    remove_column :students, :siblings_schooling_details
    remove_column :students, :is_transportation_required
    remove_column :students, :transport_pickup_point
    remove_column :students, :disability_of_student
  end
end
