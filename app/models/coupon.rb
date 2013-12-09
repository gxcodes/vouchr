class Coupon < ActiveRecord::Base
  has_many :vouchers
end
