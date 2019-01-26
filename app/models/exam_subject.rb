class ExamSubject < ApplicationRecord
  belongs_to :exam
  belongs_to :subject
  has_one :student_mark
end
