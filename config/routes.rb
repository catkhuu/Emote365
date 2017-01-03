Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get 'welcome/index'
  resources :calendars

  root 'welcome#index'
end
