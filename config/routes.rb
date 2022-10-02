Rails.application.routes.draw do
  
  
  devise_for :users
  resources :comments
  
  resources :bugs do
    member do
      put 'solve'
    end
  end

  root to: 'bugs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
