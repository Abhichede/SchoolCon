class Subject < ApplicationRecord
  belongs_to :standard
  has_and_belongs_to_many :teachers
end
