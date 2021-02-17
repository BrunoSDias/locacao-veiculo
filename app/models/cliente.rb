class Cliente < ApplicationRecord
  def self.login(login, senha)
    Cliente.find_by(login: login, senha: senha) rescue nil
  end
end
