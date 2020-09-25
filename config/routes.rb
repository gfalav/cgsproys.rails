Rails.application.routes.draw do
  resources :puntos
  post "puntos/indajax", to: 'puntos#indajax'
  resources :proyectos
  devise_for :users
  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
