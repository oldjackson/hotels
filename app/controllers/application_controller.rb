class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  private

  def set_locale
    I18n.locale = http_accept_language.language_region_compatible_from(I18n.available_locales) || I18n.default_locale
  end
end
