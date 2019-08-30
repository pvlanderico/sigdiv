Rails.application.routes.draw do
  
	get '/month_reports/:debt_id', to: 'month_reports#show', as: 'month_report'
  resources :transaction_types
  resources :currencies
  resources :creditors
  
  resources :debts do
  	resources :attachments, except: :show
  	resources :transaction_items, except: :show
  end

  root 'debts#index'
end
