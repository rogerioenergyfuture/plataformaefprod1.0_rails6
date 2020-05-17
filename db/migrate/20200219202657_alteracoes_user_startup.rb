class AlteracoesUserStartup < ActiveRecord::Migration[5.2]
  def change
    add_column :user_startups, :cellphoneppf, :string
    add_column :user_startups, :enderecoppf, :string
    add_column :user_startups, :cpfppf, :string
    add_column :user_startups, :nomefantasiappf, :string
    add_column :user_startups, :cnpjppf, :string
    add_column :user_startups, :enderecoinstituicaoppf, :string
    add_column :user_startups, :certificacaoppf, :string
    add_column :user_startups, :telppf, :string
    remove_column :user_startups, :quantidadedefuncionariosppf
    
  end
end
