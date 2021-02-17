class CreateVeiculos < ActiveRecord::Migration[5.2]
  def change
    create_table :veiculos do |t|
      t.string :nome
      t.string :cor
      t.integer :qnt_passageiros
      t.string :placa
      t.decimal :valor
      t.references :marca, foreign_key: true

      t.timestamps
    end
  end
end
