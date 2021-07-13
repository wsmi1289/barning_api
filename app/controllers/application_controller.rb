class ApplicationController < ActionController::API
  include Pundit
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection
  
  before_action :set_csrf_cookie
  protect_from_forgery with: :exception

  def root
    render plain: 'Welcome!'
  end

  private

  def set_csrf_cookie
    cookies["CSRF-TOKEN"] = form_authenticity_token
  end
end
