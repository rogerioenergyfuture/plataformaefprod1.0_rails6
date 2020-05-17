class AlteracoesUsers < ActiveRecord::Migration[5.2]
  def change
 
    add_column :user_startups, :datadenascimentoppf,:datetime
    add_column :user_startups, :tipodepessoappf,:integer
    add_reference :user_startups, :cargo
    add_column :user_startups, :enquadramentoppf,:integer
    add_column :user_startups, :quantidadedefuncionariosppf,:integer
    add_column :user_startups, :cidadeondeoprojetoserexecutadoppf,:integer
    add_column :user_startups, :jparticipoudeoutrachamadadeprojetosdepdestartupsppf,:integer
    add_column :user_startups, :razaosocialppf,:string
    add_column :user_startups, :qualisppfs, :integer, array: true, default: '{}' 
    add_column :user_startups, :current_phaseppf,:integer
    add_reference :user_normals, :companypower
    add_column :user_normals, :type,:integer
    add_column :users, :typeclasse,:integer
    
    
    
    remove_column :users, :datadenascimentoppf,:datetime
    remove_column :users, :tipodepessoappf,:integer
    remove_column :users, :cargoppf,:integer
    remove_column :users, :enquadramentoppf,:integer
    remove_column :users, :quantidadedefuncionariosppf,:integer
    remove_column :users, :cidadeondeoprojetoserexecutadoppf,:integer
    remove_column :users, :jparticipoudeoutrachamadadeprojetosdepdestartupsppf,:integer
    remove_column :users, :razaosocialppf,:string
    remove_column :users, :qualisppfs, :integer, array: true, default: '{}' 
    remove_column :users, :current_phaseppf,:integer
      
    
  end
end
