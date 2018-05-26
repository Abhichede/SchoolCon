json.extract! notification, :id, :title, :message, :from, :student_id, :updated_at
json.created_at notification.created_at.strftime("%d/%m/%Y %I:%M %P")
json.url notification_url(notification, format: :json)
