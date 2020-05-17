class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name
      t.integer :region
      t.string :sigla

      t.timestamps
    end
  end
end
