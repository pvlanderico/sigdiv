Rails.application.routes.draw do
  
  get 'next_payments/index'
  resources :currencies
  resources :creditors
  
  resources :debts do
  	resources :attachments, except: :show
  	resources :transactions, except: :show
  end

  root 'next_payments#index'
end
