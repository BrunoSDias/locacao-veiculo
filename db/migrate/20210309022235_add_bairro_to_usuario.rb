class AddBairroToUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :bairro, :string
  end
end
