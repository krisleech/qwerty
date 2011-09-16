Rails.application.routes.draw do
  resources :documents

  namespace :qwerty_admin do
    resources :nodes do 
      member do
        get 'add'
      end
    end
  end
end
