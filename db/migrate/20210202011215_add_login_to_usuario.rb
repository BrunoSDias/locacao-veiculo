class AddLoginToUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :login, :string
  end
end
