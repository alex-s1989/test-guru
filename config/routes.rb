Rails.application.routes.draw do
  
  root to: 'tests#index'
  
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: 'users/sessions' }
  
  get 'users/new'
  
  resources :tests, only: :index do
    resources :questions, only: :index, shallow: true, expect: :index do
      resources :answers, only: :index, shallow: true
    end

    member do
      post :start
    end
  end
  
  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end
  
  namespace :admin do
    root to: 'tests#index'
    resources :tests do
      patch :update_inline, on: :member
      
      resources :questions, shallow: true, expect: :index do
        resources :answers, shallow: true
      end
    end
    resources :gists, shallow: true, only: :index
  end
  
  resources :contacts, only: %i[new create]
end
