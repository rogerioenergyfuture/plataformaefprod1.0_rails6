class AlteracoesUsers2 < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_startups, :state
    add_reference :user_startups, :city
    remove_column :users, :role
    remove_column :users, :status
    remove_column :users, :name
    remove_column :users, :pipefyid
    add_column :user_startups, :pipefyid, :integer
  end
end