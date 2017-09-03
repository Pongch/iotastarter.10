Rails.application.routes.draw do
  resources :sitedonations
  resources :projects do
    resources :donations, except: [:index], controller: 'projects/donations'
  end
  root :to => "projects#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
