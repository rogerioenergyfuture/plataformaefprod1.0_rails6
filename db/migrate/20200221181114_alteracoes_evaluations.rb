class AlteracoesEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluations, :answers, :integer, array: true, default: '{}'
    add_column :evaluations, :statusbloqueio, :integer
  end
end
