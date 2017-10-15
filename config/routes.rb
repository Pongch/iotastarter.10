Rails.application.routes.draw do
  resources :sitedonations
  resources :projects do
    resources :donations, except: [:index], controller: 'projects/donations'
  end
  root to: "projects#index"

end
