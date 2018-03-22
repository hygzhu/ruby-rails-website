Rails.application.routes.draw do
  get 'welcome/index'

  #declare standard rest resource
  resources :articles

  # maps request to the root to the welcome controller index action to get 'welcome/index'
  root 'welcome#index'
end
