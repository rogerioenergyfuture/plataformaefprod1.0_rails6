class Modificationuser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :companypower
    remove_column :users, :kind
  end
end
