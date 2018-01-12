class Student < ApplicationRecord
  belongs_to :academic_year
  belongs_to :caste_category
  belongs_to :standard
  belongs_to :division
  belongs_to :caste
  belongs_to :religion

  def self_full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def father_full_name
    "#{father_first_name} #{father_middle_name} #{father_last_name}"
  end

  def mother_full_name
    "#{mother_first_name} #{mother_middle_name} #{mother_last_name}"
  end

end
