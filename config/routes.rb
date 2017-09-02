Rails.application.routes.draw do
  resources :projects do
    resources :donations, except: [:index], controller: 'projects/donations'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
