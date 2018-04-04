class TimeTable < ApplicationRecord
  acts_as_paranoid

  belongs_to :standard
  belongs_to :teacher
end
