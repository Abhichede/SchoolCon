class Exam < ApplicationRecord
  has_many :exam_subjects, dependent: :destroy
  belongs_to :standard
  belongs_to :division
  belongs_to :academic_year
  has_many :student_marks, dependent: :destroy
end
