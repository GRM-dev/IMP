class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :setup_locales
  before_action :set_locale
 
  def set_locale(locale = nil)
    I18n.locale = (locale == nil ? extract_locale_from_tld : extract_locale_from_tld(locale))
  end
  
  def extract_locale_from_tld(parsed_locale = params[:locale])
    @locales.include?(parsed_locale) ? parsed_locale : I18n.locale
  end

  def setup_locales
    @locales =  I18n.available_locales.map(&:to_s);
  end
  
  #def default_url_options(options = {})
  #  { locale: I18n.locale }.merge options
  #end
  
  
end
