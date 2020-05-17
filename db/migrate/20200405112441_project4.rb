class Project4 < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :paportesquaisinstituicoes, :string
  end
end
