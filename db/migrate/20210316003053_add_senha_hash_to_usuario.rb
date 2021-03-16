class AddSenhaHashToUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :senha_hash, :string
  end
end
