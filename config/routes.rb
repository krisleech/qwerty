Rails.application.routes.draw do
  resources :documents

  namespace :qwerty_admin do
    root :to => 'documents#index'

    resources :nodes do
      member do
        get :up
        get :down
      end
    end

    resources :documents do
      member do
        get :up
        get :down
      end
    end
  end
end
