class Voucher < ActiveRecord::Base
  validates :nominal, numericality: true
  belongs_to :coupon
end
