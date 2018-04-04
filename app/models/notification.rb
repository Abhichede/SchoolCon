class Notification < ApplicationRecord
  acts_as_paranoid

  belongs_to :student

  attr_accessor :notification_type
  attr_accessor :type_data, :by_sms, :by_mail

  def student
    Student.unscoped { super }
  end

end
