class Teacher < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_many :time_tables
  has_many :attendances


  def fullname
    "#{first_name} #{middle_name} #{last_name}"
  end
end
