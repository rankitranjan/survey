Rails.application.routes.draw do
  # resources :answers
  resources :questionnaires do
    resources :questions do
      resources :answers
    end
  end

  namespace :api do
    namespace :v1  do
      resources :questionnaires, only: :index do
        resources :questions, only: [:create, :destroy]
      end
    end
  end

  devise_for :users
  root to: "questionnaires#index"
end
