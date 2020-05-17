class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer :kind
      t.references :project
      t.references :user_normal
      t.references :sum_avalicao

      t.timestamps
    end
  end
end
