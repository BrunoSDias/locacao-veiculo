class Administrador < ApplicationRecord
  include BCrypt
  validates :nome, :login, :senha, presence: true

  def encoded
    administrador = self.as_json
    administrador["id"] = JsonWebToken.encode(administrador["id"])
    administrador
  end

  def senha
    @senha ||= Password.new(hash_senha)
  end

  def senha=(nova_senha)
    @senha = Password.create(nova_senha)
    self.hash_senha = @senha
  end

  def self.login(login, senha)
    administrador = Administrador.find_by(login: login)
    if administrador.present? && administrador.authenticate(senha)
      administrador
    else
      nil
    end
  end

  def authenticate(senha)
    if self.senha == senha
      true
    else
      false
    end
  end
end
