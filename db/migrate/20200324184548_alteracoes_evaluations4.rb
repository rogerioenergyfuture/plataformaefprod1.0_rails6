class AlteracoesEvaluations4 < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluations, :pergunta1, :string
    add_column :evaluations, :pergunta2, :string
    add_column :evaluations, :pergunta3, :string
    add_column :evaluations, :pergunta4, :string
  end
end
