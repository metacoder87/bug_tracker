Rails.application.routes.draw do
  devise_for :users
  root to: 'bugs#index'

  resources :bugs do
    collection do
      get :active
      get :archive
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
