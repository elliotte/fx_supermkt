Fxsupermarket::Application.routes.draw do
  devise_for :vendors
  devise_for :customers

  get :dashboard, to: 'vendors#dashboard', as: :vendors_dashboard
  get :dashboard, to: 'customers#dashboard', as: :customers_dashboard

  root 'welcome#index'
end
