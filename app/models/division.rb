class Division < ApplicationRecord
  acts_as_paranoid

  has_and_belongs_to_many :students
  belongs_to :standard
  has_many :attendances, dependent: :destroy
  has_one :class_teacher
end
