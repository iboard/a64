A64::Application.routes.draw do

  mount Admin::Engine => "/admin", as: "admin"

  match "/signin" => "session#new",    as: "new_session", via: :get
  match "/signin" => "session#create", as: "session", via: :post
  match "/signout" => "session#destroy", as: "sign_out", via: :delete

  resources :pages

  root :to => 'pages#index'
end
