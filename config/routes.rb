Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_for :users, :controllers => {
  :sessions => 'users/sessions'
  }
  devise_scope :user do
    get 'login' => 'devise/sessions#new'
    post 'login' => 'devise/sessions#create'
    delete 'destroy' => 'devise/sessions#destroy',as: :current_user_destroy
  end

  resources :signup ,only: [:index, :create] do
    collection do
      get 'registration'
      post 'registration' => 'signup#first_validation'
      get 'sms_authentication'
      post 'sms_authentication' => 'signup#sms_check'
      get 'address'
      post 'address' => 'signup#second_validation'
      get 'done'
    end
  end

  root 'posts#index'

  resources :posts do
    resources :messages, only: [:new, :create]
  end


end
