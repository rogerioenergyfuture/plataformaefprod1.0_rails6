class AlteracoesSumEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :sum_evaluations, :questions, :integer, array: true, default: '{}'
    add_column :sum_evaluations, :year, :integer
  end
end
