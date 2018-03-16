class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  add_breadcrumb 'Home', :root_path

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def send_sms_to_parent(student, notification)
    puts student.father_mobile
    response = RestClient.get "http://login.bulksmsgateway.in/sendmessage.php?user=abhichede777&password=abhijit123@&mobile=#{student.father_mobile}&message=#{notification.message}&sender=DNYNDP&type=3"
    case response.code
      when 400
        puts response
      when 200
        puts response
      else
        fail "Invalid response #{response} received."
    end
  end
end
