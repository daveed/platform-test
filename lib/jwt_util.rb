class JwtUtil
  SECRET_KEY_BASE = Rails.application.secrets.secret_key_base
  JWT_ALGORITHM   = 'HS512'.freeze

  class << self
    def encode(payload)
      JWT.encode(payload, SECRET_KEY_BASE, JWT_ALGORITHM)
    end

    def decode(token)
      JWT.decode(token, SECRET_KEY_BASE, true, algorithm: JWT_ALGORITHM).first
    rescue
      nil
    end
  end
end
