class NotificationMailer < ApplicationMailer
  default from: "contact@linkeritsolutions.com"

  def sample_email(student)
    @user = student
    mail(to: @user.student_email, subject: 'Sample Email')
  end

  def notify_student(student, notification)
    @student = student
    @notification = notification

    mail(to: @student.student_email, subject: @notification.title)
  end
end
