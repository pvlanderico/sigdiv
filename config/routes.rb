Rails.application.routes.draw do
  
  resources :currencies
  resources :creditors
  
  resources :debts do
  	resources :attachments, except: :show
  	resources :withdraws, except: [:index, :show]
  end

  root 'debts#index'
end
