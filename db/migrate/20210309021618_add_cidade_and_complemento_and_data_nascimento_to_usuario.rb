class AddCidadeAndComplementoAndDataNascimentoToUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :cidade, :string
    add_column :usuarios, :complemento, :string
    add_column :usuarios, :data_nascimento, :datetime
  end
end
