class Student < ApplicationRecord
  acts_as_paranoid

  belongs_to :caste_category
  belongs_to :caste
  belongs_to :religion
  belongs_to :parent

  has_and_belongs_to_many :fee_categories
  has_and_belongs_to_many :academic_years
  has_and_belongs_to_many :standards
  has_and_belongs_to_many :divisions

  has_many :student_wise_fees, dependent: :destroy
  has_many :student_wise_discounts, dependent: :destroy
  has_many :student_fee_payments, dependent: :destroy
  has_many :student_wise_fines, dependent: :destroy
  has_many :student_wise_instant_fees, dependent: :destroy
  has_many :student_certificates, dependent: :destroy
  has_many :notifications, dependent: :destroy

  attr_accessor :siblings

  mount_uploader :profile_photo, StudentProfileUploader

  def self_full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def self.search_by_full_name(search)
    @names = search.split(" ")

    if @names.size == 2
      where("(lower(first_name) LIKE ? AND lower(last_name) LIKE ?) OR (lower(middle_name) LIKE ? AND lower(last_name) LIKE ?) OR (lower(first_name) LIKE ? AND lower(middle_name) LIKE ?)", "%#{@names[0].downcase}%", "%#{@names[1].downcase}%", "%#{@names[0].downcase}%", "%#{@names[1].downcase}%", "%#{@names[0].downcase}%", "%#{@names[1].downcase}%")
    elsif @names.size == 3
      where("lower(first_name) LIKE ? AND lower(middle_name) LIKE ? AND lower(last_name) LIKE ?", "%#{@names[0].downcase}%", "%#{@names[1].downcase}%", "%#{@names[2].downcase}%")
    elsif @names.size == 1
      where("lower(first_name) LIKE ? OR lower(middle_name) LIKE ? OR lower(last_name) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
    end
  end

  def father_full_name
    "#{father_first_name} #{father_middle_name} #{father_last_name}"
  end

  def mother_full_name
    "#{mother_first_name} #{mother_middle_name} #{mother_last_name}"
  end

  def current_age
    dob = date_of_birth.to_date
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
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
    student_wise_fees.where(academic_year_id: academic_years.where(is_active: true).first.id).each do |fee|
      total_amount += fee.amount.to_f
    end
    total_amount
  end

  def current_total_paid
    total_amount = 0.0
    student_fee_payments.where(academic_year_id: academic_years.where(is_active: true).first.id).each do |fee|
      total_amount += fee.amount.to_f
    end
    total_amount
  end

  def current_total_discount
    total_amount = 0.0
    student_wise_discounts.where(academic_year_id: academic_years.where(is_active: true).first.id).each do |fee|
      total_amount += fee.amount.to_f
    end
    total_amount
  end

  def current_total_fine
    total_amount = 0.0
    student_wise_fines.where(academic_year_id: academic_years.where(is_active: true).first.id).each do |fee|
      total_amount += fee.amount.to_f
    end
    total_amount
  end

  def current_total_instant_fee
    total_amount = 0.0
    student_wise_instant_fees.where(academic_year_id: academic_years.where(is_active: true).first.id).each do |fee|
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


  def attendance
    @attendances = divisions.last.attendances.group_by {|a| Date.parse(a.date).beginning_of_month}
  end

  def timetable(day)
    @timetables = standards.last.time_tables.where(division: divisions.last.name, day: day)
  end


end
