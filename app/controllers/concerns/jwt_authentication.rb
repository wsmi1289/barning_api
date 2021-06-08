module JwtAuthentication
  extend ActiveSupport::Concern

  include ActionController::HttpAuthentication::Token
  
  def require_authentication
    !token || !valid_token
  end

  def current_user
    @_current_user ||= User.find_by(decode_token)
  end

  protected

  def valid_token
    if decode_token
      session[:jwt] = JwtToken.encode(current_user)
      return true
    end
  rescue
    render_forbidden
  end

  private

  def decode_token
    @_decode_token ||= JwtToken.decode(token)
  rescue
    nil
  end

  def render_forbidden
    render json: { errors: 'Access Denied' }, status: :forbidden
  end

  def token
    @_token ||= session[:jwt]
  end
end