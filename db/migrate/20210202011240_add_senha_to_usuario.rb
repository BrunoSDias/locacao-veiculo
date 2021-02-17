class AddSenhaToUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :senha, :string
  end
end
