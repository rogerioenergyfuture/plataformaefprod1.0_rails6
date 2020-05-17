class AlteracoesCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :codmuc, :string
    add_column :cities, :anocenso, :integer
    add_column :cities, :population, :integer
  end
end
