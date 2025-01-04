Rails.application.routes.draw do

  resources :car
  resources :maintenance_service

  resources :login do
    post 'auth', on: :member
    get 'logout', on: :member
    put 'check_nip', on: :member
    put 'update_password', on: :member
  end

  match "/500", to: "errors#internal_server_error", via: :all
end
