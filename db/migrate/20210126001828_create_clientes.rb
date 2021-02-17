class CreateClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :cpf
      t.string :cep
      t.string :estado
      t.string :rua
      t.string :numero

      t.timestamps
    end
  end
end
