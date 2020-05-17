class Atualiazaoprojeto20 < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :projetojarecebeualgumaporteppf
    add_column :projects, :projetojarecebeualgumaporteppf, :string
  end
end
