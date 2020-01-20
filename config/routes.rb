Rails.application.routes.draw do
  devise_for :users
  root 'signup#index'
end
