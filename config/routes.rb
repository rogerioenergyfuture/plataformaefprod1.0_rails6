Rails.application.routes.draw do
  
  

  resources :evaluations
  resources :sum_evaluations
  resources :projects
  #resources :cities
  #resources :states
  resources :user_startups
  resources :user_normals
  #resources :cargos
  resources :companypowers
  #resources :users
  get 'welcome/index'

 
  
=begin 

resources :user_normals do
match 'resetavaliacao' => 'user_normals#resetavaliacao', via: [:get, :post], as: :reset
#  collection {post :upload}
end  
=end 
devise_scope :users do
  get 'signin', to: 'users/sessions#new'
  #get 'signout', to: 'users/registration#destroy'
  get 'welcome/sobre', to: 'welcome#sobre', as: 'welcome/sobre' 
  get 'welcome/allpages', to: 'welcome#allpages', as: 'welcome/allpages'
  get 'users/accountaltsenha/:id', to: 'users#accountaltsenha', as: 'users/accountaltsenha'
  get 'user_normals/resetavaliacao/:id', to: 'user_normals#resetavaliacao', as: 'user_normals/resetavaliacao'  
end
  
  
resource :user, only: [:edit] do #Atenção rota para alterar a senha do usuário
  collection do
    patch 'update_password'
  end
end 

devise_for :users, controllers:{
  sessions: 'users/sessions'
 } 
  
resources :users  
root "welcome#index"  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
#If no route matches#
 match '*path', via: :all, to: redirect('/404')   
  
  

end



