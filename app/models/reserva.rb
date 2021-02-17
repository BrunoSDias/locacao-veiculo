class Reserva < ApplicationRecord
  belongs_to :veiculo
  belongs_to :usuario

  STATUS = {
    aguardando: "Aguardando pagamento",
    pago: "Pago, embalando produto",
  }
end
