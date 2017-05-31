Rails.application.routes.draw do
  resources :instituicos
  get 'cont_users/index'
  get 'cont_users/new'
  get 'cont_users/edit'

  post 'savenew', to: 'users#savenew'
  
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  
  resources :cadastros

  resources :relatorios

  match 'download' => 'relatorios#download', via: [:get, :post]
  #post 'download'=> 'relatorios#download'


  root 'cadastros#index'

  get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
