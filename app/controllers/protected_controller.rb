class ProtectedController < ApplicationController
  before_action :require_jwt

  def require_jwt
    token = request.headers["HTTP_AUTHORIZATION"]
    if !token
      head :forbidden
    end
    if !valid_token(token)
      head :forbidden
    end
  end

  private

  def valid_token(token)
    return false unless token

    token.gsub!('Bearer ','')
    begin
      decoded_token = JWT.decode(
        token,
        ENV.fetch('JWT_SECRET', 'secret'),
        true,

      return true
    rescue JWT::DecodeError
      Rails.logger.warn "Error decoding the JWT: "+ e.to_s
    rescue JWT::ExpiredSignature
      Rails.logger.warn "Expired JWT: "+ e.to_s
    end
    false
  end

  def claims
    {
      verify_iss: true,
      iss: expected_iss,
      verify_aud: true,
      aud: expected_aud,
      verify_expiration: true,
      exp_leeway: 30,
      algorithm: 'HS256'
    }
  end
end
