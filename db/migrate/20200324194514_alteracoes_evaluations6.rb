class AlteracoesEvaluations6 < ActiveRecord::Migration[5.2]
  def change
    remove_reference :user_startups, :sum_evaluation
    add_reference :evaluations, :sum_evaluation    
  end
end
