Fxsupermarket::Application.routes.draw do
  devise_for :vendors
  devise_for :customers

  get '/vendors/dashboard', to: 'vendors#dashboard', as: :vendors_dashboard
  get '/customers/dashboard', to: 'customers#dashboard', as: :customers_dashboard

  root 'welcome#index'
end
