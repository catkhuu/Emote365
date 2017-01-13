Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get 'welcome/index'
  root 'welcome#index'
  get 'users/logout'
  get '/days/date', to: "days#date"
  
  resources :calendars
end
