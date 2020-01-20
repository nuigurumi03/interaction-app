Rails.application.routes.draw do
  devise_for :users, skip: :all
  root 'signup#index'
end
