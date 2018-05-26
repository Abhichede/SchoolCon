class ClassTeacher < ApplicationRecord
  belongs_to :standard
  belongs_to :division
  belongs_to :teacher
end
