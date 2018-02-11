class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  add_breadcrumb 'Home', :root_path

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
