Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get 'welcome/index'
<<<<<<< 466cce20ab206d0e817c05453a38a9dde0775aa8
  resources :calendars

  root 'welcome#index'
=======
  root 'welcome#index'

  resources :calendars
  resources :users, except: [ :destroy, :index ]
>>>>>>> experiment with various api to get WOEID based on users current location
end
