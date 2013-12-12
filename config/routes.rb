Vouchr::Application.routes.draw do
  root 'phone_numbers#index'

  devise_for :users, path: '', path_names: { sign_in: '/rahasia', sign_up: '/rahasia/sign_up'}

  namespace :rahasia do
    # root "dashboard#index"

    resources :histories, :coupons, :vouchers, :dashboard
  end

  get  "phone_numbers/index"
  post "phone_numbers/new"
  get  "phone_numbers/show"
  get  "phone_numbers/generate_luhn"
  post "phone_numbers/coupon_validate"
  
end
    
