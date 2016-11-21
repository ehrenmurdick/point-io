Rails.application.routes.draw do
  root to: 'parties#index'
  resources :parties, path: "/" do
    resources :votes

    member do
      get :result
    end
  end
end
