Tramway::Admin::Engine.routes.draw do
  root to: 'welcome#index'

  resources :records
end
