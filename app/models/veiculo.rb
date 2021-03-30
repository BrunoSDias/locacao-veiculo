class Veiculo < ApplicationRecord
  validates :nome, :cor, :qnt_passageiros, :placa, :valor, presence: true

  has_one_attached :foto do |attachable|
    attachable.variant :thumb, resize: "300x300"
  end

  belongs_to :marca
end
