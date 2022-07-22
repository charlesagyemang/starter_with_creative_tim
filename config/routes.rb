Rails.application.routes.draw do
  get 'cockpit/admin'
  get 'cockpit/user'
  devise_for :users
  root to: 'cockpit#admin'

  get 'pages/dashboard'
  get 'pages/icons'
  get 'pages/profile'
  get 'pages/tables'
  get 'pages/login'
  get 'pages/register'
  get 'pages/upgrade'
end
