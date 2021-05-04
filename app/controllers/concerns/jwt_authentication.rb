module JwtAuthentication
  extend ActiveSupport::Concern

  include ActionController::HttpAuthentication::Token
  
  class Failure < StandardError; end

  def require_authorization
    !token || !valid_token
  end

  def current_user
    @_current_user ||= begin
      decode_token
    rescue JwtAuthentication::Failure
      nil
    end
  end

  protected

  def valid_token
    return true if decode_token
  rescue JwtAuthentication::Failure
    render_forbidden
  end

  private

    def claims
      {
        verify_iss: true,
        iss: ENV.fetch('EXPECTED_ISS', 'localhost:5000'),
        verify_aud: true,
        aud: ENV.fetch('EXPECTED_AUD', 'localhost:3000'),
        verify_expiration: true,
        exp_leeway: 30,
        algorithm: 'HS256'
      }
    end

    def decode_token
      payload = JWT.decode(token, ENV.fetch('JWT_SECRET', 'secret'), true, claims)
      User.find_by(payload[0]['data'])
    rescue JWT::DecodeError, JWT::ExpiredSignature
      raise JwtAuthentication::Failure
    end

    def render_forbidden
      render json: { errors: 'Access Denied' }, status: :forbidden
    end

    def token
      @_token ||= token_and_options(request).first
    end
end