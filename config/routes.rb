Vouchr::Application.routes.draw do
  get "howtouse/index"
  root 'phone_numbers#index'

  devise_for :users, path: '', path_names: { sign_in: '/rahasia', sign_up: '/rahasia/sign_up'}

  namespace :rahasia do
    # root "dashboard#index"

    resources :coupons, :vouchers, :dashboard
    resources :histories, only: [:index, :show]
  end

  get  "phone_numbers/index"
  post "phone_numbers/new"
  get  "phone_numbers/show"
  get  "phone_numbers/seeds"
  post "phone_numbers/coupon_validate"
  
end
    
