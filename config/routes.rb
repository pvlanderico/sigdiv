Rails.application.routes.draw do
  resources :creditors
  resources :debts

  root 'debts#index'
end
