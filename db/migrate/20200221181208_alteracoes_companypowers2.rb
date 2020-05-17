class AlteracoesCompanypowers2 < ActiveRecord::Migration[5.2]
  def change
    add_column :companypowers, :listfavoritos, :integer, array: true, default: '{}'
  end
end
