class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :authenticate_user!
  before_action :set_locale

  before_action :configure_permitted_parameters, if: :devise_controller?

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

  rescue_from CanCan::AccessDenied do |exception|
    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to session.delete(:return_to), :alert => exception.message }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:password, :password_confirmation, roles: []])
  end
end
