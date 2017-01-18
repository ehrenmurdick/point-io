Rails.application.routes.draw do
  root to: 'parties#index'
  resources :parties, path: "/" do
    resources :votes

    member do
      get :result
      put :reset
    end
  end
end
