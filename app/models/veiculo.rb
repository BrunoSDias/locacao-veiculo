class Veiculo < ApplicationRecord
  has_one_attached :foto do |attachable|
    attachable.variant :thumb, resize: "300x300"
  end

  belongs_to :marca
end
