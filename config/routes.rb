Rails.application.routes.draw do
  root 'pages#index'

  post 'results', to: 'pages#search', as: :search
end
