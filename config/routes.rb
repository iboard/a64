A64::Application.routes.draw do

  mount Admin::Engine => "/admin", as: "admin"

  resources :pages

  root :to => 'pages#index'
end
