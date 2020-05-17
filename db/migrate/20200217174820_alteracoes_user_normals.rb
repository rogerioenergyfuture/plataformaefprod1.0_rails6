class AlteracoesUserNormals < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_normals, :type
    add_column :user_normals, :typerole, :integer
  end
end
