json.array!(@coupons) do |coupon|
  json.extract! coupon, :id, :code, :voucher_id, :usage
  json.url coupon_url(coupon, format: :json)
end
