Rails.application.routes.draw do
  get 'cockpit/admin'
  get 'cockpit/user'
  resources :loan_payments
  resources :loans
  resources :loaners
  resources :payouts
  resources :contributions
  resources :investors
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
