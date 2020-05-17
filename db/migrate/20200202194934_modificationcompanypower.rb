class Modificationcompanypower < ActiveRecord::Migration[5.2]
  def change
    remove_column :companypowers, :type
    add_column :companypowers, :category,:integer 
  end
end
