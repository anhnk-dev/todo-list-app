Rails.application.routes.draw do
  root "tasks#index"

  devise_for :users

  resources :tasks, only: %i(index new create) do
    member do
      post :mark_completed
    end
  end
end
