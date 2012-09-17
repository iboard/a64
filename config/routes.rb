A64::Application.routes.draw do

  resources :pages

  root :to => 'pages#index'
end
