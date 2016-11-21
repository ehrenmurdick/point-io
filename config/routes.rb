Rails.application.routes.draw do
  resources :parties do
    resources :votes

    member do
      get :result
    end
  end
end
