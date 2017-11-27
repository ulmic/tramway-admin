Tramway::Admin::Engine.routes.draw do
  mount Tramway::User::Engine => '/'

  root to: 'welcome#index'
end
