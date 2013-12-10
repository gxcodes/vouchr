class Voucher < ActiveRecord::Base
  validates :nominal, numericality: true, uniqueness: true
end
