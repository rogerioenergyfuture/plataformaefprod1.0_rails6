class AlteracoesProjeto3 < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :companypower_id
    add_column :projects, :companypower_ids, :integer, array: true, default: '{}'
    add_column :projects, :tokenidppf, :string
  end
end
