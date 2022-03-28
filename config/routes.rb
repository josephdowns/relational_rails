Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/makers', to: 'makers#index'
  get '/makers/new', to: 'makers#new'
  post '/makers', to: 'makers#create'
  get '/makers/:id', to: 'makers#show'
  get '/makers/:id/edit', to: 'makers#edit'
  patch 'makers/:id', to: 'makers#update'
  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  get '/makers/:maker_id/cars', to: 'maker_cars#index'
  get '/makers/:maker_id/cars/new', to: 'maker_cars#new'
  post '/makers/:maker_id/cars', to: 'maker_cars#create'
end
