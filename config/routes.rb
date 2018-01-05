Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    root 'user#index', as: :authenticated_root
  end


  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :users
  put 'admins/:id' => 'user#toggle_admin', :as => "toggle_admin"
end
