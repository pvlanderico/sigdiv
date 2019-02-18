Rails.application.routes.draw do
  
  resources :currencies
  resources :creditors
  
  resources :debts do
  	resources :attachments, except: :show
  	resources :transactions, except: :show
  end

  root 'debts#index'
end
