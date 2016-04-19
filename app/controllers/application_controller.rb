class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :setup_locales
  before_action :set_locale
  helper_method :current_user, :is_dashboard, :current_building, :current_dashboard
  
  def set_locale(locale = nil)
    I18n.locale = (locale == nil ? extract_locale_from_tld : extract_locale_from_tld(locale))
  end
  
  def extract_locale_from_tld(parsed_locale = params[:locale])
    @locales.include?(parsed_locale) ? parsed_locale : I18n.locale
  end

  def setup_locales
    @locales = I18n.available_locales.map(&:to_s);
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_building
      @current_building ||= Building.find_by_user_id(current_user.id)  if current_user
  end
  
  def current_dashboard
    if session[:user_id]
      @current_dashboard ||= Dashboard.find(current_building.id) if current_building
    end
  end
  
  def require_user
    redirect_to root_path, :alert => t('errors.messages.not_logged_in') unless current_user
  end
  
  def is_dashboard
    ["dashboard", "building"].include?(params[:controller])
  end
end
