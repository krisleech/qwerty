Rails.application.routes.draw do
  resources :documents, :only => [:show, :index]

  root :to => 'documents#show'

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


  match '*permalink' => 'documents#show', :as => :document
end
