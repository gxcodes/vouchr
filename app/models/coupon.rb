class Coupon < ActiveRecord::Base
  after_initialize :init
  before_create :generate_code

  def init
    self.balance  = self.nominal
  end

  def generate_code
    code =  (('A'..'Z').to_a + (0..9).to_a).shuffle[0,8].join
    self.code = code.insert(4,'-')
  end
end
