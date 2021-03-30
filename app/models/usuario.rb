class Usuario < ApplicationRecord
  include BCrypt
  has_many :reservas, dependent: :delete_all
  validates :nome, :cpf, :login, :senha, :data_nascimento, :endereco, :numero, :estado, :cidade, :complemento, :bairro,  presence: true

  def senha
    @senha ||= Password.new(self.hash_senha)
  end

  def senha=(nova_senha)
    @senha = Password.create(nova_senha)
    self.hash_senha = @senha
  end

  def self.login(login, senha)
    usuario = Usuario.find_by(login: login)
    if usuario.present? && usuario.authenticate(senha)
      usuario
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

  def clear_cpf
    cpf.gsub('-', '').gsub('.', '')
  end
end
