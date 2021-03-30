class Marca < ApplicationRecord
  has_many :veiculos
  validates :nome, presence: true
end
