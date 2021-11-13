Rails.application.routes.draw do
  resources :users

  get '/log', to: 'auth#userSignedIn'
  get '/auth', to: 'auth#persist'
  post '/login', to: 'auth#login'
end
