Rails.application.routes.draw do
  root "projects#index"
  resources :projects do
    resources :comments, only: %i[create destroy]
  end
end
