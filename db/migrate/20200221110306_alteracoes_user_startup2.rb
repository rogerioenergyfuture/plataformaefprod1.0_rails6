class AlteracoesUserStartup2 < ActiveRecord::Migration[5.2]
  def change
    add_column :user_startups, :leuasinformacoessobreasconcessionariasppf, :string
  end
end
