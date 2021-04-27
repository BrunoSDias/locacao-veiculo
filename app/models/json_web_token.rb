class JsonWebToken
  JWT_SECRET = Rails.application.secrets.secret_key_base

  def self.encode(usuario_id)
    JWT.encode({id: usuario_id}, JWT_SECRET, 'HS256')
  end
  
  def self.decode(usuario_id)
    JWT.decode(usuario_id, JWT_SECRET, true, { algorithm: 'HS256' })[0]
  end
end