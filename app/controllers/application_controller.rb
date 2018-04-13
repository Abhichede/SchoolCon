class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :skip_authenticate
  before_action :set_locale

  before_action :set_mailer_host

  before_action :configure_permitted_parameters, if: :devise_controller?

  add_breadcrumb 'Home', :root_path
  # load_and_authorize_resource

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def send_sms_to_parent(student, notification)
    puts student.father_mobile
    #response = RestClient.get "http://login.bulksmsgateway.in/sendmessage.php?user=abhichede777&password=abhijit123@&mobile=#{student.father_mobile}&message=#{notification.message}&sender=DNYNDP&type=3"
    response = RestClient.get "http://login.bulksmsgateway.in/sendmessage.php?user=pravinapsunde&password=Pra23402&mobile=#{student.father_mobile}&message=#{notification.message}&sender=DNYNDP&type=3"
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
      format.html { redirect_to session.delete(:return_to).nil? ? session.delete(:return_to) : (current_user.has_role?(:parent) ? students_url : root_url), :alert => exception.message }
    end
  end

  def set_mailer_host
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

  private
    def skip_authenticate
      unless params[:controller].split('/')[0] == 'devise_token_auth'|| params[:controller].split('/')[0] == 'api'
        authenticate_user!
      end
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:password, :password_confirmation, roles: []])
  end
end
