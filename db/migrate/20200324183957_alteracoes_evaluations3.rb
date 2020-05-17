class AlteracoesEvaluations3 < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluations, :notapergunta1, :decimal
    add_column :evaluations, :notapergunta2, :decimal
    add_column :evaluations, :notapergunta3, :decimal
    add_column :evaluations, :notapergunta4, :decimal
    add_column :evaluations, :comments, :string
    
  end
end
