Rails.application.routes.draw do
  root 'welcome#index'

  get '/house', to: 'house#index'
end
