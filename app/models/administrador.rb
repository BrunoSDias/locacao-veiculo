class Administrador < ApplicationRecord
  def self.login(login, senha)
    Administrador.find_by(login: login, senha: senha)
  end
end
