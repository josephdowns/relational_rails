Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/makers', to: 'makers#index'
  get '/makers/:id', to: 'makers#show'
  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  get '/makers/:id/cars', to: 'maker_cars#index'
end
