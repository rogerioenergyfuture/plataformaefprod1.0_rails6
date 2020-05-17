class Modificationuser2 < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :datadenascimentoppf,:datetime
    add_column :users, :tipodepessoappf,:integer
    add_column :users, :cargoppf,:integer
    add_column :users, :enquadramentoppf,:integer
    add_column :users, :quantidadedefuncionariosppf,:integer
    add_column :users, :cidadeondeoprojetoserexecutadoppf,:integer
    add_column :users, :jparticipoudeoutrachamadadeprojetosdepdestartupsppf,:integer
    add_column :users, :razaosocialppf,:string
    add_column :users, :qualisppfs, :integer, array: true, default: '{}' 
    add_column :users, :current_phaseppf,:integer
    remove_reference :users, :companypower
    
  end
end
