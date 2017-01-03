Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get 'welcome/index'
  root 'welcome#index'

  resources :calendars
end
