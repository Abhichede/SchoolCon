class Teacher < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_many :time_tables
  has_many :attendances
  has_many :class_teachers
  has_many :leave_applications
  has_many :parent_messages

  has_many :questions, dependent: :destroy

  def fullname
    "#{first_name} #{middle_name} #{last_name}"
  end

  def address
    "#{address_one} #{address_two} \n
      #{city} #{state} \n
      #{country} #{pincode}"
  end

end
