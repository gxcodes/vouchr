json.array!(@vouchers) do |voucher|
  json.extract! voucher, :id, :nominal
  json.url voucher_url(voucher, format: :json)
end
