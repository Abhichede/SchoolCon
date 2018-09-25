class Parent < ApplicationRecord
  has_many :students

  attr_accessor :user_type, :teacher_id

  def user_account_email
    @user = User.where(email: students.first.father_email).first

    @user.email
  end
  def user_account_id
    @user = User.where(email: students.first.father_email).first

    @user.student_id
  end
end
