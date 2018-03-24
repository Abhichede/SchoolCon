class Standard < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_many :time_tables
  has_and_belongs_to_many :students
  has_many :divisions

  has_many :attendances
  has_many :fee_categories

  def total_allocated_fee
    fee = 0
    students.each do |student|
      fee += student.current_total_fee
    end

    fee
  end

  def total_paid_fee
    fee = 0
    students.each do |student|
      fee += student.current_total_paid
    end

    fee
  end

  def total_discount
    fee = 0
    students.each do |student|
      fee += student.current_total_discount
    end

    fee
  end

  def total_fine
    fee = 0
    students.each do |student|
      fee += student.current_total_fine
    end

    fee
  end

  def total_instant_fee
    fee = 0
    students.each do |student|
      fee += student.current_total_instant_fee
    end

    fee
  end

  def total_balance_amount
    fee = 0
    students.each do |student|
      fee += student.current_total_paid
    end

    fee
  end
end
