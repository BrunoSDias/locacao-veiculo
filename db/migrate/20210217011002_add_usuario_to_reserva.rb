class AddUsuarioToReserva < ActiveRecord::Migration[5.2]
  def change
    add_reference :reservas, :usuario, foreign_key: true
  end
end
