Rails.application.routes.draw do
  resources :documents

  namespace :qwerty_admin do
    resources :nodes 
  end
end
