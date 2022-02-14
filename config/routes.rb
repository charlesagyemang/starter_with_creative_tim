Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#dashboard'

  get 'pages/dashboard'
  get 'pages/icons'
  get 'pages/profile'
  get 'pages/tables'
  get 'pages/login'
  get 'pages/register'
  get 'pages/upgrade'
end
