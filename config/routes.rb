Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    delete 'destroy' => 'devise/sessions#destroy',as: :current_user_destroy
  end

  root 'signup#index'

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
end
