Vouchr::Application.routes.draw do
 
  devise_for :users, path: 'rahasia', path_names: { sign_in: '' }
  root 'phone_numbers#index'

  namespace :rahasia do
    # root "dashboard#index"
    resources :histories, :coupons, :vouchers, :dashboard
  end

  get "phone_numbers/index"
  post"phone_numbers/new"
  get "phone_numbers/show"
  get "phone_numbers/generate_luhn"
  
end
