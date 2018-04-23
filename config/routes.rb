Rails.application.routes.draw do
  root 'static_pages#home'
  get '/bitcoin', to: 'static_pages#home'
  get '/btc', to: 'static_pages#home'
  get '/eth', to: 'static_pages#eth'
  get '/ethereum', to: 'static_pages#eth'
  get '/bch', to: 'static_pages#bch'
  get '/bitcoin-cash', to: 'static_pages#bch'
  get '/ltc', to: 'static_pages#ltc'
  get '/litecoin', to: 'static_pages#ltc'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
