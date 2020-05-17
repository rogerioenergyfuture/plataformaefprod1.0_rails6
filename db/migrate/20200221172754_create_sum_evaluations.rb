class CreateSumEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :sum_evaluations do |t|
      t.integer :kind
      t.datetime :deadline
      
      t.timestamps
    end
  end
end
