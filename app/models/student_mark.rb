class StudentMark < ApplicationRecord
  belongs_to :exam
  belongs_to :student
  belongs_to :exam_subject
end
