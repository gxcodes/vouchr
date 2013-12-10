json.array!(@histories) do |history|
  json.extract! history, :id, :phone_number, :coupon_code, :nominal_usage, :date, :voucher_code
  json.url history_url(history, format: :json)
end
