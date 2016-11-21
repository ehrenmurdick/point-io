Rails.application.routes.draw do
  root to: 'parties#index'
  resources :parties do
    resources :votes

    member do
      get :result
    end
  end
end
