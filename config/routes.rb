Rails.application.routes.draw do
  root to: 'pages#index'

  get '/search', to: 'team#search'
end
