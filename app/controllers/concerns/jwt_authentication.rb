module JwtAuthentication
  extend ActiveSupport::Concern

  include ActionController::HttpAuthentication::Token
  
  def require_authorization
    !token || !valid_token
  end

  def current_user
    @_current_user ||= User.find_by(decode_token)
  end

  protected

  def valid_token
    return true if decode_token
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
    @_token ||= params[:token] || token_and_options(request).first
  end
end