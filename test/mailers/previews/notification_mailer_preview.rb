# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    NotificationMailer.sample_email(Student.first)
  end
end
