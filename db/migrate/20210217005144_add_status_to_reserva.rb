class AddStatusToReserva < ActiveRecord::Migration[5.2]
  def change
    add_column :reservas, :status, :string
  end
end
