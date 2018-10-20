class Attendance < ApplicationRecord
  acts_as_paranoid

  belongs_to :standard
  belongs_to :division
  belongs_to :teacher
  belongs_to :subject
  belongs_to :academic_year

  validates :academic_year_id, presence: true
  validates :standard_id, presence: true
  validates :division_id, presence: true
  validates :subject_id, presence: true
  validates :teacher_id, presence: true


  def filter_by_student(student)
    att_data["#{student.id}"] === 'on' ? 'Present' : 'Absent'
  end
end
