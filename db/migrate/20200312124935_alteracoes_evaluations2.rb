class AlteracoesEvaluations2 < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluations, :notaavalicacao, :decimal
    add_column :evaluations, :favorito, :boolean
  end
end
