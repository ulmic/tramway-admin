Rails.application.routes.draw do
  mount Tramway::Admin::Engine => "/tramway-admin"
end
