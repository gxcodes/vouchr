class Coupon < ActiveRecord::Base
  require "luhn"
  
  after_initialize :init
  before_create :generate_code
  before_update :generate_code

  def init
    self.balance  = self.nominal
  end

  def generate_code
    self.code = Luhn.generate 16, mod: (self.nominal/5000)
  end

end
