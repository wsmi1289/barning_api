class JwtToken
  SECRET = ENV.fetch('JWT_SECRET', 'secret').freeze
  ISSUER = ENV.fetch('EXPECTED_ISS', 'localhost:5000').freeze
  AUDIENCE = ENV.fetch('EXPECTED_AUD', 'localhost:3000').freeze

  def self.decode(token)
    payload = JWT.decode(token, SECRET, true, claims)[0]['sub']
  end

  def self.encode(user)
    JWT.encode({
      iss: ISSUER,
      exp: expiration,
      aud: AUDIENCE,
      sub: { id: user.id, email: user.email },
    }, SECRET, 'HS256')
  end

  private

  def self.expiration
    ENV.fetch('JWT_EXPIRY_MINS', '5').to_i.minutes.from_now.to_i
  end


  def self.claims
    {
      verify_iss: true,
      iss: ISSUER,
      verify_aud: true,
      aud: AUDIENCE,
      verify_expiration: true,
      exp_leeway: 30,
      algorithm: 'HS256'
    }
  end
end