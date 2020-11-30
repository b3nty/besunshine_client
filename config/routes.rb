Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations", sessions: "users/sessions"} do
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :admin do
    resources :users do
      member do
        get :methode_check
      end
    end
  end
  resources :dashboard do
    collection do
      get :conf
    end
  end

  root 'welcome#index'
end
