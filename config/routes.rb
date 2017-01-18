Rails.application.routes.draw do
  root to: 'home#index'
  
  resources :parties do
    resources :votes

    member do
      get :result
      put :reset
    end
  end
end
