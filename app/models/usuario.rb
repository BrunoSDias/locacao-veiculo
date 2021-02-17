class Usuario < ApplicationRecord
  def self.login(login, senha)
    Usuario.find_by(login: login, senha: senha) rescue nil
  end
end
