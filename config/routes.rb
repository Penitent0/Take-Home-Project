Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/create', to: 'subscriptions#create'
      get '/index', to: 'subscriptions#index'
      patch '/update', to: 'subscriptions#update'
    end
  end
end
