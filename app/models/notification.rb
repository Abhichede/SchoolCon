class Notification < ApplicationRecord
  acts_as_paranoid

  belongs_to :student

  attr_accessor :notification_type
  attr_accessor :type_data, :by_sms, :by_mail, :by_app

  def student
    Student.unscoped { super }
  end

end
