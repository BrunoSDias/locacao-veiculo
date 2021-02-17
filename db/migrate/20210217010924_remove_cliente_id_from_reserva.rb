class RemoveClienteIdFromReserva < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservas, :cliente_id
  end
end
