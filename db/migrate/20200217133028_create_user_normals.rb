class CreateUserNormals < ActiveRecord::Migration[5.2]
  def change
    create_table :user_normals do |t|
      t.string :name
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
