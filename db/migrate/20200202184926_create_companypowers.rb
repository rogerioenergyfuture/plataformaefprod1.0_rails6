class CreateCompanypowers < ActiveRecord::Migration[5.2]
  def change
    create_table :companypowers do |t|
      t.string :name
      t.integer :type
      t.integer :status
      t.string :responsibleemail

      t.timestamps
    end
  end
end
