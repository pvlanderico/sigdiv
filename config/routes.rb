Rails.application.routes.draw do
  
  resources :transaction_types
  resources :currencies
  resources :creditors
  
  resources :debts do
  	resources :attachments, except: :show
  	resources :transactions_items, except: :show
  end

  root 'debts#index'
end
