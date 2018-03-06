class Student < ApplicationRecord
  belongs_to :academic_year
  belongs_to :caste_category
  belongs_to :standard
  belongs_to :division
  belongs_to :caste
  belongs_to :religion
  belongs_to :parent

  has_and_belongs_to_many :fee_categories

  has_many :student_wise_fees
  has_many :student_wise_discounts
  has_many :student_fee_payments
  has_many :student_wise_fines
  has_many :student_wise_instant_fees

  attr_accessor :siblings

  mount_uploader :profile_photo, StudentProfileUploader
  mount_uploader :leaving_certificate, LeavingCertificateUploader unless :leaving_certificate

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

  def current_total_fee
    total_amount = 0.0
    student_wise_fees.where(academic_year_id: academic_year_id).each do |fee|
      total_amount += fee.amount.to_f
    end
    total_amount
  end

  def current_total_paid
    total_amount = 0.0
    student_fee_payments.where(academic_year_id: academic_year_id).each do |fee|
      total_amount += fee.amount.to_f
    end
    total_amount
  end

  def current_total_discount
    total_amount = 0.0
    student_wise_discounts.where(academic_year_id: academic_year_id).each do |fee|
      total_amount += fee.amount.to_f
    end
    total_amount
  end

  def current_total_fine
    total_amount = 0.0
    student_wise_fines.where(academic_year_id: academic_year_id).each do |fee|
      total_amount += fee.amount.to_f
    end
    total_amount
  end

  def current_total_instant_fee
    total_amount = 0.0
    student_wise_instant_fees.where(academic_year_id: academic_year_id).each do |fee|
      total_amount += fee.amount.to_f
    end
    total_amount
  end

  def total_fee_with_discount_fine
    total_amount = (current_total_fee - current_total_discount) + current_total_fine + current_total_instant_fee
  end

  def current_balance_amount
    total_amount = (total_fee_with_discount_fine - current_total_paid)
  end



end
