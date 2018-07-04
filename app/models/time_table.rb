class TimeTable < ApplicationRecord
  acts_as_paranoid

  belongs_to :standard
  belongs_to :teacher

  def start_time_local
    start_time.strftime("%I:%M %p")
  end

  def end_time_local
    end_time.strftime("%I:%M %p")
  end

  def teacher_name
    teacher.fullname
  end
end
