class AlteracoesEvaluations5 < ActiveRecord::Migration[5.2]
  def change
    remove_reference :evaluations, :sum_avalicao
    add_reference :user_startups, :sum_evaluation
  end
end
