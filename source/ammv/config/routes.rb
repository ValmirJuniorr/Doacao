Rails.application.routes.draw do
  get 'cont_users/index'
  get 'cont_users/new'
  get 'cont_users/edit'
  get 'relatorios/index'
  post 'savenew', to: 'users#savenew'
  
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  resources :cadastros
  root 'cadastros#index'

  get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
