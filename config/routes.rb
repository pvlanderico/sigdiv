Rails.application.routes.draw do
  resources :creditors
  resources :debts do
  	resources :attachments, except: :show
  end

  root 'debts#index'
end
