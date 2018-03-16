class Notification < ApplicationRecord
  belongs_to :student

  attr_accessor :notification_type
  attr_accessor :type_data
end
