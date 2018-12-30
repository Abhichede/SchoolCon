class Standard < ApplicationRecord
  acts_as_paranoid

  has_and_belongs_to_many :subjects
  has_many :time_tables, dependent: :destroy
  has_and_belongs_to_many :students
  has_many :divisions, dependent: :destroy

  has_many :attendances
  has_many :fee_categories, dependent: :destroy
  has_many :class_teachers
  has_many :homeworks
  has_many :exams

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
      fee += student.current_balance_amount
    end

    fee
  end
end
