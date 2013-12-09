class Voucher < ActiveRecord::Base
  validates :nominal, numericality: true
end
