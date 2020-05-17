class ModificatiocompaypowerpipefyId < ActiveRecord::Migration[5.2]
  def change
    add_column :companypowers, :pipefyid,:integer 
  end
end
