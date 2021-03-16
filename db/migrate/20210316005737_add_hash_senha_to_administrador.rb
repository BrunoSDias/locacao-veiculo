class AddHashSenhaToAdministrador < ActiveRecord::Migration[5.2]
  def change
    add_column :administradors, :hash_senha, :string
  end
end
