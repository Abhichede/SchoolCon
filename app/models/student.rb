class Student < ApplicationRecord
  belongs_to :academic_year
  belongs_to :caste_category
  belongs_to :standard
  belongs_to :division
  belongs_to :caste
  belongs_to :religion

  has_and_belongs_to_many :fee_categories

  def self_full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def father_full_name
    "#{father_first_name} #{father_middle_name} #{father_last_name}"
  end

  def mother_full_name
    "#{mother_first_name} #{mother_middle_name} #{mother_last_name}"
  end

  def total_fee
    amount = 0
    fee_categories.each do |fee|
      amount += fee.amount.to_f
    end

    "#{amount}"
  end

  def residential_address
    "#{residential_address_one}, #{residential_address_two} \n
      #{residential_city}, #{residential_state} \n
      #{residential_country}, #{residential_pincode}"
  end

  def permanent_address
    "#{permanent_address_one}, #{permanent_address_two} \n
    #{permanent_city}, #{permanent_state} \n
    #{permanent_country}, #{permanent_pincode}"
  end

end
