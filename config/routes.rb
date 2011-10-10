Rails.application.routes.draw do
  resources :documents, :only => [:show, :index]

  root :to => 'documents#show'

  scope Qwerty.options[:admin_route_namespace], :module => :qwerty_admin, :as => :qwerty_admin do
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
