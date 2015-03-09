Rails.application.routes.draw do
  resources :stations, only: [:show] do
    member do
      get 'flow'
    end
  end
end
